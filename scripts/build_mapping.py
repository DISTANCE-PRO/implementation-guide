#!/usr/bin/env python3
"""Erzeugt aus mapping/distance-pro-mapping.csv

  * input/pagecontent/mapping.md             (Mapping-Tabelle des IG)
  * input/fsh/generated-logical-model.fsh    (Logical Model + FHIR-Mapping)
  * input/fsh/generated-vs-laborparameter.fsh (ValueSet der Laborparameter)

Die CSV-Datei ist die einzige Quelle der Abbildung; die erzeugten Dateien
nicht von Hand bearbeiten. Aufruf: python3 scripts/build_mapping.py
"""
import csv
import re
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MII = "https://www.medizininformatik-initiative.de/fhir"
ISIK = "https://gematik.de/fhir/isik/StructureDefinition"

# Schlüssel der Spalte "profil" -> (Anzeigename, Canonical bzw. lokale Profil-Id)
PROFILES = {
    # MII KDS Basismodule
    "patient": ("MII PR Person Patient", f"{MII}/core/modul-person/StructureDefinition/Patient"),
    "patient-pseudo": ("MII PR Person Patient (Pseudonymisiert)", f"{MII}/core/modul-person/StructureDefinition/PatientPseudonymisiert"),
    "encounter": ("MII PR Fall Kontakt mit einer Gesundheitseinrichtung", f"{MII}/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"),
    "diagnose": ("MII PR Diagnose Condition", f"{MII}/core/modul-diagnose/StructureDefinition/Diagnose"),
    "prozedur": ("MII PR Prozedur Procedure", f"{MII}/core/modul-prozedur/StructureDefinition/Procedure"),
    "medstatement": ("MII PR Medikation MedicationStatement", f"{MII}/core/modul-medikation/StructureDefinition/MedicationStatement"),
    # MII KDS Erweiterungsmodule
    "icu-groesse": ("MII PR ICU MUV Körpergröße", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-muv-koerpergroesse"),
    "icu-gewicht": ("MII PR ICU MUV Körpergewicht", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-muv-koerpergewicht"),
    "icu-hf": ("MII PR ICU MUV Herzfrequenz", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-muv-herzfrequenz"),
    "icu-blutdruck": ("MII PR ICU MUV Arterieller Blutdruck", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-muv-arterieller-blutdruck"),
    "icu-nrs": ("MII PR ICU Score Numerische Ratingskala", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-score-numerische-ratingskala"),
    "icu-cam": ("MII PR ICU Score CAM-ICU", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-score-cam-icu"),
    "icu-rass": ("MII PR ICU Score RASS", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-score-rass"),
    "icu-sofa": ("MII PR ICU Score SOFA", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-score-sofa"),
    "icu-blutverlust": ("MII PR ICU Bilanz Ausfuhr Blutverlust", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-bilanz-ausfuhr-blutverlust"),
    "icu-tagesbilanz": ("MII PR ICU Bilanz Tagesbilanz Flüssigkeit", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-bilanz-tagesbilanz-fluessigkeit"),
    "icu-beatmung": ("MII PR ICU Beatmung", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-beatmung"),
    "icu-ecv": ("MII PR ICU Extrakorporales Verfahren", f"{MII}/ext/modul-icu/StructureDefinition/mii-pr-icu-extrakorporales-verfahren"),
    "isik-idealgewicht": ("SD MII ICU Ideales Körpergewicht (ISiK 6)", f"{ISIK}/sd-mii-icu-ideales-koerpergewicht"),
    "isik-spo2": ("SD MII ICU Sauerstoffsättigung im arteriellen Blut durch Pulsoxymetrie (ISiK 6)", f"{ISIK}/sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie"),
    "onko-systemtherapie": ("MII PR Onko Systemische Therapie", f"{MII}/ext/modul-onko/StructureDefinition/mii-pr-onko-systemische-therapie"),
    "onko-systemtherapie-med": ("MII PR Onko Systemische Therapie Medikation", f"{MII}/ext/modul-onko/StructureDefinition/mii-pr-onko-systemische-therapie-medikation"),
    "onko-strahlentherapie": ("MII PR Onko Strahlentherapie", f"{MII}/ext/modul-onko/StructureDefinition/mii-pr-onko-strahlentherapie"),
    "onko-operation": ("MII PR Onko Operation", f"{MII}/ext/modul-onko/StructureDefinition/mii-pr-onko-operation"),
    "onko-karnofsky": ("MII PR Onko Allgemeiner Leistungszustand Karnofsky", f"{MII}/ext/modul-onko/StructureDefinition/mii-pr-onko-allgemeiner-leistungszustand-karnofsky"),
    "onko-ecog": ("MII PR Onko Allgemeiner Leistungszustand ECOG", f"{MII}/ext/modul-onko/StructureDefinition/mii-pr-onko-allgemeiner-leistungszustand-ecog"),
    "onko-tnm": ("MII PR Onko TNM Klassifikation", f"{MII}/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-klassifikation"),
    "onko-histologie": ("MII PR Onko Histologie ICD-O-3", f"{MII}/ext/modul-onko/StructureDefinition/mii-pr-onko-histologie-icdo3"),
    "onko-grading": ("MII PR Onko Grading", f"{MII}/ext/modul-onko/StructureDefinition/mii-pr-onko-grading"),
    "onko-asa": ("MII PR Onko ASA Klassifikation", f"{MII}/ext/modul-onko/StructureDefinition/mii-pr-onko-asa-klassifikation"),
    "patho-report": ("MII PR Patho Report", f"{MII}/ext/modul-patho/StructureDefinition/mii-pr-patho-report"),
    "pro-qr": ("MII PR PRO QuestionnaireResponse", f"{MII}/ext/modul-pro/StructureDefinition/mii-pr-pro-questionnaire-response"),
    "pro-score": ("MII PR PRO Score Instance", f"{MII}/ext/modul-pro/StructureDefinition/mii-pr-pro-score-instance"),
    "pro-phq9": ("MII PR PRO Observation PHQ-9", f"{MII}/ext/modul-pro/StructureDefinition/mii-pr-pro-observation-phq-9"),
    "kardio-rauchen": ("MII PR Kardio Observation Rauchen", f"{MII}/ext/modul-kardio/StructureDefinition/mii-pr-kardio-observation-rauchen"),
    "kardio-nyha": ("MII PR Kardio Score NYHA", f"{MII}/ext/modul-kardio/StructureDefinition/mii-pr-kardio-score-nyha"),
    "sdd-schulabschluss": ("MII PR SDD Schulabschluss", f"{MII}/ext/modul-soziodemographie/StructureDefinition/mii-pr-sdd-schulabschluss"),
    "sdd-ausbildung": ("MII PR SDD Ausbildung", f"{MII}/ext/modul-soziodemographie/StructureDefinition/mii-pr-sdd-ausbildung"),
    "sdd-beschaeftigung": ("MII PR SDD Beschäftigungsstatus", f"{MII}/ext/modul-soziodemographie/StructureDefinition/mii-pr-sdd-beschaeftigungsstatus"),
    # Profile dieses IG (lokale Id)
    "dp-proband": ("DISTANCE:PRO PR Proband", "distance-pro-pr-proband"),
    "dp-bmi": ("DISTANCE:PRO PR BMI", "distance-pro-pr-bmi"),
    "dp-gewichtsverlust": ("DISTANCE:PRO PR Gewichtsverlust", "distance-pro-pr-gewichtsverlust"),
    "dp-alter": ("DISTANCE:PRO PR Alter bei Einschluss", "distance-pro-pr-alter"),
    "dp-lebenssituation": ("DISTANCE:PRO PR Lebenssituation", "distance-pro-pr-lebenssituation"),
    "dp-wohnsituation": ("DISTANCE:PRO PR Wohnsituation", "distance-pro-pr-wohnsituation"),
    "dp-hundehaltung": ("DISTANCE:PRO PR Hundehaltung", "distance-pro-pr-hundehaltung"),
    "dp-soziale-unterstuetzung": ("DISTANCE:PRO PR Soziale Unterstützung", "distance-pro-pr-soziale-unterstuetzung"),
    "dp-alkoholkonsum": ("DISTANCE:PRO PR Alkoholkonsum", "distance-pro-pr-alkoholkonsum"),
    "dp-funktionelle-therapie": ("DISTANCE:PRO PR Funktionelle Therapie", "distance-pro-pr-funktionelle-therapie"),
    "dp-rehabilitation": ("DISTANCE:PRO PR Rehabilitation", "distance-pro-pr-rehabilitation"),
    "dp-met": ("DISTANCE:PRO PR Metabolisches Äquivalent", "distance-pro-pr-met"),
    "dp-katecholamintherapie": ("DISTANCE:PRO PR Katecholamintherapie", "distance-pro-pr-katecholamintherapie"),
    "dp-sedierung": ("DISTANCE:PRO PR Sedierung", "distance-pro-pr-sedierung"),
    "dp-postop": ("DISTANCE:PRO PR Postoperatives Ereignis", "distance-pro-pr-postoperatives-ereignis"),
    "dp-labor": ("DISTANCE:PRO PR Laboruntersuchung", "distance-pro-pr-laboruntersuchung"),
}

# Gruppen des Logical Model: Schlüssel -> (Titel, Kardinalität der Blattelemente)
GROUPS = {
    "identifikation": ("Identifizierende Daten", "0..1"),
    "person": ("Patientenbezogene Daten", "0..1"),
    "soziodemographie": ("Soziodemographische Daten", "0..1"),
    "therapieverlauf": ("Therapien im Verlauf", "0..*"),
    "verlauf": ("Verlaufserhebung", "0..*"),
    "fragebogen": ("Fragebögen", "0..*"),
    "diagnosen": ("Diagnosen und Prozeduren", "0..*"),
    "onkologie": ("Onkologie", "0..*"),
    "icuScores": ("ICU-Scores", "0..*"),
    "anaesthesie": ("Anästhesie und OP", "0..*"),
    "icuVerlauf": ("ICU-Verlauf", "0..*"),
    "vitaldaten": ("Vitaldaten", "0..*"),
    "blutgasanalyse": ("Blutgasanalyse", "0..*"),
    "labor": ("Laborwerte", "0..*"),
}

STATUS = {
    "KDS": "KDS-Profil direkt",
    "KDS-abgeleitet": "abgeleitet von KDS-Profil",
    "ISiK": "ISiK-6-Profil (ICU-Linie)",
    "Neu": "neues Profil",
    "Offen": "offen",
}

GENERATED = "// Erzeugt von scripts/build_mapping.py aus mapping/distance-pro-mapping.csv – nicht von Hand bearbeiten.\n"


def read_rows():
    with open(ROOT / "mapping" / "distance-pro-mapping.csv", newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f, delimiter=";"))
    for r in rows:
        r["profiles"] = r["profil"].split("|")
        for p in r["profiles"]:
            if p not in PROFILES:
                raise SystemExit(f"Item {r['nr']}: unbekannter Profilschlüssel '{p}'")
        if r["status"] not in STATUS:
            raise SystemExit(f"Item {r['nr']}: unbekannter Status '{r['status']}'")
        r["group"], r["leaf"] = r["lm"].split(".")
        if r["group"] not in GROUPS:
            raise SystemExit(f"Item {r['nr']}: unbekannte Gruppe '{r['group']}'")
    return rows


# Module, deren Canonicals der IG Publisher nicht auf eine Webseite auflösen kann
UNLINKED_MODULES = ("/modul-kardio/", "/modul-pro/", "/modul-patho/")


def profile_link(key):
    name, target = PROFILES[key]
    if any(m in target for m in UNLINKED_MODULES):
        return f'<span title="{target}">{name}</span>'
    href = target if target.startswith("http") else f"StructureDefinition-{target}.html"
    return f"[{name}]({href})"


def cell(text):
    return text.replace("|", "\\|")


def build_page(rows):
    counts = Counter(r["status"] for r in rows)
    out = [
        "<!-- Erzeugt von scripts/build_mapping.py aus mapping/distance-pro-mapping.csv – nicht von Hand bearbeiten. -->",
        "",
        "Diese Seite bildet jedes Item des *Catalog of Items* (CoI, Version 1.1 vom 08.09.2026) auf ein FHIR-Profil ab. "
        "Vorrang haben bestehende Profile des MII Kerndatensatzes 2027; nur wo kein passendes Profil existiert, "
        "definiert dieser IG ein eigenes. Dieselbe Abbildung liegt maschinenlesbar als "
        "[Logical Model mit FHIR-Mapping](StructureDefinition-distance-pro-lm-datensatz-mappings.html) vor.",
        "",
        "### Übersicht",
        "",
        "| Art der Abbildung | Items |",
        "|---|---|",
    ]
    for key, label in STATUS.items():
        out.append(f"| {label} | {counts.get(key, 0)} |")
    out.append(f"| **gesamt** | **{len(rows)}** |")
    out.append("")
    for group, (title, _) in GROUPS.items():
        grp = [r for r in rows if r["group"] == group]
        if not grp:
            continue
        out += [f"### {title}", "", "| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |", "|---|---|---|---|---|---|---|---|"]
        for r in grp:
            profiles = "<br/>".join(profile_link(p) for p in r["profiles"])
            element = "<br/>".join(f"`{e.strip()}`" for e in r["element"].split(";"))
            out.append(
                f"| {r['nr']} | {cell(r['item'])} | {r['relevanz'] or '–'} | {STATUS[r['status']]} | {profiles} | {element} "
                f"| {cell(r['codes'])} | {cell(r['hinweis'])} |"
            )
        out.append("")
    (ROOT / "input" / "pagecontent" / "mapping.md").write_text("\n".join(out), encoding="utf-8")


def fsh_str(text):
    return text.replace("\\", "\\\\").replace('"', '\\"')


def build_logical_model(rows):
    out = [
        GENERATED,
        "Logical: DISTANCE_PRO_LM_Datensatz",
        "Id: distance-pro-lm-datensatz",
        'Title: "DISTANCE:PRO LM Datensatz"',
        'Description: "Logisches Modell des Catalog of Items (CoI) der Studie DISTANCE:PRO, Version 1.1 vom 08.09.2026."',
    ]
    for group, (title, card) in GROUPS.items():
        grp = [r for r in rows if r["group"] == group]
        if not grp:
            continue
        out.append(f'* {group} 0..1 BackboneElement "{title}" "{title}"')
        for r in grp:
            definition = f"CoI-Item {r['nr']}: {r['item']}"
            if r["relevanz"]:
                definition += f" (Relevanz: {r['relevanz']})"
            out.append(f'  * {r["leaf"]} {card} {r["typ"]} "{fsh_str(r["item"])}" "{fsh_str(definition)}"')
    out += [
        "",
        "Mapping: DISTANCE_PRO_LM_Datensatz_FHIR",
        "Id: FHIR",
        'Title: "Abbildung auf FHIR-Profile (MII KDS 2027)"',
        "Source: DISTANCE_PRO_LM_Datensatz",
        'Target: "http://hl7.org/fhir"',
    ]
    for r in rows:
        names = ", ".join(PROFILES[p][0] for p in r["profiles"])
        out.append(f'* {r["lm"]} -> "{fsh_str(r["element"])}" "{fsh_str(names)}"')
    (ROOT / "input" / "fsh" / "generated-logical-model.fsh").write_text("\n".join(out) + "\n", encoding="utf-8")


def build_lab_valueset(rows):
    out = [
        GENERATED,
        "ValueSet: DISTANCE_PRO_VS_Laborparameter",
        "Id: distance-pro-vs-laborparameter",
        'Title: "DISTANCE:PRO VS Laborparameter"',
        'Description: "LOINC-Kodes der in DISTANCE:PRO erhobenen Blutgas- und Laborparameter (CoI-Items 77–106)."',
        "* ^experimental = false",
    ]
    for r in rows:
        if "dp-labor" not in r["profiles"]:
            continue
        out.append(f"// CoI-Item {r['nr']}: {r['item']}")
        codes = re.findall(r"\d+-\d", r["codes"])
        if not codes:
            raise SystemExit(f"Item {r['nr']}: kein LOINC-Kode in Spalte 'codes'")
        out += [f"* $loinc#{c}" for c in codes]
    (ROOT / "input" / "fsh" / "generated-vs-laborparameter.fsh").write_text("\n".join(out) + "\n", encoding="utf-8")


def main():
    rows = read_rows()
    build_page(rows)
    build_logical_model(rows)
    build_lab_valueset(rows)
    print(f"{len(rows)} Items verarbeitet.")


if __name__ == "__main__":
    main()
