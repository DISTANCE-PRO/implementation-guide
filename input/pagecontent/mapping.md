<!-- Erzeugt von scripts/build_mapping.py aus mapping/distance-pro-mapping.csv – nicht von Hand bearbeiten. -->

Diese Seite bildet jedes Item des *Catalog of Items* (CoI, Version 1.1 vom 08.09.2026) auf ein FHIR-Profil ab. Vorrang haben bestehende Profile des MII Kerndatensatzes 2027; nur wo kein passendes Profil existiert, definiert dieser IG ein eigenes. Dieselbe Abbildung liegt maschinenlesbar als [Logical Model mit FHIR-Mapping](StructureDefinition-distance-pro-lm-datensatz-mappings.html) vor.

### Übersicht

| Art der Abbildung | Items |
|---|---|
| KDS-Profil direkt | 53 |
| abgeleitet von KDS-Profil | 47 |
| ISiK-6-Profil (ICU-Linie) | 2 |
| neues Profil | 6 |
| offen | 1 |
| **gesamt** | **109** |

### Identifizierende Daten

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 1 | Name | SONDER | KDS-Profil direkt | [MII PR Person Patient](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient) | `Patient.name:name` |  | Nur im identifizierenden Datenbestand des Studienteams; nicht Teil des pseudonymisierten Forschungsdatensatzes. |
| 2 | Geburtsdatum | SONDER | KDS-Profil direkt | [MII PR Person Patient](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)<br/>[MII PR Person Patient (Pseudonymisiert)](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert) | `Patient.birthDate` |  | Im pseudonymisierten Datensatz vergröbert (siehe Item 14 Alter). |
| 3 | Anschrift | SONDER | KDS-Profil direkt | [MII PR Person Patient](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient) | `Patient.address:Strassenanschrift` |  | Nur im identifizierenden Datenbestand. |
| 4 | Telefon/Handynummer | SONDER | KDS-Profil direkt | [MII PR Person Patient](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient) | `Patient.telecom` | system = phone | Nur im identifizierenden Datenbestand; telecom ist im KDS-Profil nicht Must-Support, aber zulässig. |
| 5 | Fallnummer | SONDER | KDS-Profil direkt | [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung) | `Encounter.identifier:Aufnahmenummer` | type = VN | Für die Forschungsdatennutzung zu pseudonymisieren. |
| 6 | Pat.-ID | SONDER | KDS-Profil direkt | [MII PR Person Patient](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)<br/>[MII PR Person Patient (Pseudonymisiert)](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert) | `Patient.identifier:pid`<br/>`Patient.identifier:PseudonymisierterIdentifier` | type = MR bzw. PSEUDED | Pseudonymisierung über die Treuhandstelle/das DIZ; Verfahren im Katalog noch offen. |

### Patientenbezogene Daten

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 7 | Studien-ID | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Proband](StructureDefinition-distance-pro-pr-proband.html) | `ResearchSubject.identifier:subjectIdentificationCode` | type = ANON | Format (z. B. 001-PAT-001) ist noch festzulegen. |
| 8 | Studienzentrums-Nr | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Proband](StructureDefinition-distance-pro-pr-proband.html) | `ResearchSubject.extension:studienzentrum` | Zentrumsnummer 1–10 | R4-ResearchSubject kennt kein Zentrum; deshalb Extension mit Verweis auf das Studienzentrum. |
| 9 | Größe | MUSS | KDS-Profil direkt | [MII PR ICU MUV Körpergröße](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-muv-koerpergroesse) | `Observation.value[x]:valueQuantity` | LOINC 8302-2, SNOMED CT 1153637007; cm |  |
| 10 | Gewicht | MUSS | KDS-Profil direkt | [MII PR ICU MUV Körpergewicht](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-muv-koerpergewicht) | `Observation.value[x]:valueQuantity` | LOINC 29463-7, SNOMED CT 27113001; kg |  |
| 11 | BMI | berechnet | neues Profil | [DISTANCE:PRO PR BMI](StructureDefinition-distance-pro-pr-bmi.html) | `Observation.value[x]:valueQuantity` | LOINC 39156-5; kg/m2 | Kein BMI-Profil im KDS 2027; Profil auf Basis des FHIR-Core-Vitalzeichenprofils. Verweis auf Größe/Gewicht über derivedFrom. |
| 12 | Ideales Gewicht | berechnet | ISiK-6-Profil (ICU-Linie) | [SD MII ICU Ideales Körpergewicht (ISiK 6)](https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-ideales-koerpergewicht) | `Observation.value[x]` | LOINC 50064-5, SNOMED CT 170804003; kg | Profil des ICU-Moduls, das in der 2027er Linie unter ISiK 6 weitergeführt wird. |
| 13 | Gewichtsverlust | SOLL | neues Profil | [DISTANCE:PRO PR Gewichtsverlust](StructureDefinition-distance-pro-pr-gewichtsverlust.html) | `Observation.value[x]:valueQuantity` | SNOMED CT 89362005; kg | Bezugszeitraum im Katalog nicht festgelegt; optional über effectivePeriod. |
| 14 | Alter | MUSS | neues Profil | [DISTANCE:PRO PR Alter bei Einschluss](StructureDefinition-distance-pro-pr-alter.html) | `Observation.value[x]:valueQuantity` | LOINC 30525-0; a | Alter zum Einschlusszeitpunkt, da das Geburtsdatum im Forschungsdatensatz nicht exakt vorliegt. |

### Soziodemographische Daten

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 15 | Lebenssituation | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Lebenssituation](StructureDefinition-distance-pro-pr-lebenssituation.html) | `Observation.value[x]:valueCodeableConcept` | LOINC 46468-5 | Auswahlliste im Katalog noch nicht abschließend. Ergänzend im KDS: Haushaltsgröße, Partnerschaft. |
| 16 | Wohnsituation | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Wohnsituation](StructureDefinition-distance-pro-pr-wohnsituation.html) | `Observation.value[x]:valueCodeableConcept` | LOINC 71802-3 | Auswahlliste im Katalog noch nicht abschließend. Verwandt im KDS: Betreuungssituation. |
| 17 | Hund | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Hundehaltung](StructureDefinition-distance-pro-pr-hundehaltung.html) | `Observation.value[x]:valueCodeableConcept` | ja/nein (v2-0136) |  |
| 18 | Unterstützung/soziales Umfeld | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Soziale Unterstützung](StructureDefinition-distance-pro-pr-soziale-unterstuetzung.html) | `Observation.value[x]:valueString` | SNOMED CT 405076007 | Freitext. Ergänzend im KDS: Vertrauensperson (ja/nein). |
| 19 | Raucher | MUSS | KDS-Profil direkt | <span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-kardio/StructureDefinition/mii-pr-kardio-observation-rauchen">MII PR Kardio Observation Rauchen</span> | `Observation.value[x]:valueCodeableConcept` | LOINC 72166-2, SNOMED CT 77176002 | Wertemenge: Raucherstatus (IPS), feiner als ja/nein. |
| 20 | Pack years | MUSS | KDS-Profil direkt | <span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-kardio/StructureDefinition/mii-pr-kardio-observation-rauchen">MII PR Kardio Observation Rauchen</span> | `Observation.component:packungsjahre` | SNOMED CT 401201003; {pack-years} |  |
| 21 | Alkohol | – | neues Profil | [DISTANCE:PRO PR Alkoholkonsum](StructureDefinition-distance-pro-pr-alkoholkonsum.html) | `Observation.value[x]:valueCodeableConcept` | LOINC 11331-6; ja/nein | ISiKAlkoholAbusus bildet nur Abusus ab, nicht den Konsum. |
| 22 | Alkohol - wie viel? | – | neues Profil | [DISTANCE:PRO PR Alkoholkonsum](StructureDefinition-distance-pro-pr-alkoholkonsum.html) | `Observation.component:reinalkohol`<br/>`Observation.component:risikobewertung` | SNOMED CT 896810008 (g/d); SNOMED CT 428202005 / 429775004 | Entweder Reinalkohol in g/Tag oder Bewertung riskant/nicht riskant nach S3-Leitlinie. |
| 23 | Bildungsstand | – | KDS-Profil direkt | [MII PR SDD Schulabschluss](https://www.medizininformatik-initiative.de/fhir/ext/modul-soziodemographie/StructureDefinition/mii-pr-sdd-schulabschluss)<br/>[MII PR SDD Ausbildung](https://www.medizininformatik-initiative.de/fhir/ext/modul-soziodemographie/StructureDefinition/mii-pr-sdd-ausbildung) | `Observation.value[x]` | SNOMED CT 276031006 bzw. LOINC 82589-3 | Höchster Schulabschluss und höchster beruflicher Abschluss getrennt. |
| 24 | Berufstätig zum Einschlusszeitpunkt | – | KDS-Profil direkt | [MII PR SDD Beschäftigungsstatus](https://www.medizininformatik-initiative.de/fhir/ext/modul-soziodemographie/StructureDefinition/mii-pr-sdd-beschaeftigungsstatus) | `Observation.value[x]` | LOINC 67875-5 | effectiveDateTime = Einschluss. ja/nein ergibt sich aus dem Beschäftigungsstatus. |

### Therapien im Verlauf

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 25 | Chemotherapie | MUSS | KDS-Profil direkt | [MII PR Onko Systemische Therapie](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-systemische-therapie) | `Procedure.performed[x]` | Art der Therapie = CH | Auch für die Kontrollgruppe zu erfassen. |
| 26 | Immunsuppressive Therapie | MUSS | KDS-Profil direkt | [MII PR Medikation MedicationStatement](https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/MedicationStatement) | `MedicationStatement.effective[x]` | ATC L04 | Bei onkologischer Immuntherapie stattdessen Onko Systemische Therapie (Art IM). |
| 27 | Strahlentherapie | MUSS | KDS-Profil direkt | [MII PR Onko Strahlentherapie](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-strahlentherapie) | `Procedure.performed[x]` |  |  |
| 28 | Physiotherapie | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Funktionelle Therapie](StructureDefinition-distance-pro-pr-funktionelle-therapie.html) | `Procedure.performed[x]` | SNOMED CT 91251008 |  |
| 29 | Ergotherapie | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Funktionelle Therapie](StructureDefinition-distance-pro-pr-funktionelle-therapie.html) | `Procedure.performed[x]` | SNOMED CT 84478008 |  |
| 30 | Logopädie | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Funktionelle Therapie](StructureDefinition-distance-pro-pr-funktionelle-therapie.html) | `Procedure.performed[x]` | SNOMED CT 311555007 |  |
| 31 | Rehabilitationszentrum | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Rehabilitation](StructureDefinition-distance-pro-pr-rehabilitation.html) | `Encounter.class` | AMB / IMP |  |
| NEU-1 | Dauer der Reha | SOLL | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Rehabilitation](StructureDefinition-distance-pro-pr-rehabilitation.html) | `Encounter.period` |  |  |

### Verlaufserhebung

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 32 | Aktuelle Berufstätigätigkeit | MUSS | KDS-Profil direkt | [MII PR SDD Beschäftigungsstatus](https://www.medizininformatik-initiative.de/fhir/ext/modul-soziodemographie/StructureDefinition/mii-pr-sdd-beschaeftigungsstatus) | `Observation.value[x]` | LOINC 67875-5 | Je Follow-up eine Observation. Der Teilzeitanteil in % ist im KDS-Profil nicht vorgesehen (siehe Offene Punkte). |
| 33 | Karnofsky Index | MUSS | KDS-Profil direkt | [MII PR Onko Allgemeiner Leistungszustand Karnofsky](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-allgemeiner-leistungszustand-karnofsky) | `Observation.value[x]` | SNOMED CT 761869008 | Identisch mit Item 47. |

### Fragebögen

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 34 | EORT-QLQ-C30 | – | KDS-Profil direkt | <span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-pro/StructureDefinition/mii-pr-pro-questionnaire-response">MII PR PRO QuestionnaireResponse</span><br/><span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-pro/StructureDefinition/mii-pr-pro-score-instance">MII PR PRO Score Instance</span> | `QuestionnaireResponse.item`<br/>`Observation.value[x]` | Questionnaire mii-qst-pro-eortc-qlq-c30; Scores eortc-qlq-c30-* | Fragebogen und Skalenwerte sind im KDS-Modul PRO definiert. |
| 35 | PHQ9 | – | KDS-Profil direkt | <span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-pro/StructureDefinition/mii-pr-pro-questionnaire-response">MII PR PRO QuestionnaireResponse</span><br/><span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-pro/StructureDefinition/mii-pr-pro-observation-phq-9">MII PR PRO Observation PHQ-9</span> | `QuestionnaireResponse.item`<br/>`Observation.value[x]` | Questionnaire mii-qst-pro-phq-9; LOINC 44261-6 |  |
| 36 | GAD7 | – | KDS-Profil direkt | <span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-pro/StructureDefinition/mii-pr-pro-questionnaire-response">MII PR PRO QuestionnaireResponse</span><br/><span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-pro/StructureDefinition/mii-pr-pro-score-instance">MII PR PRO Score Instance</span> | `QuestionnaireResponse.item`<br/>`Observation.value[x]` | Questionnaire mii-qst-pro-gad-7; LOINC 70274-6 |  |
| 37 | NRS | – | KDS-Profil direkt | [MII PR ICU Score Numerische Ratingskala](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-score-numerische-ratingskala) | `Observation.value[x]` | SNOMED CT 1284857008 | Profil erlaubt 0–10 (Katalog: 1–10). Lokalisation über bodySite, Bezugszeitraum über effectivePeriod. |
| 38 | Alternative für MOCA Test ?? | – | offen | <span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-pro/StructureDefinition/mii-pr-pro-questionnaire-response">MII PR PRO QuestionnaireResponse</span><br/><span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-pro/StructureDefinition/mii-pr-pro-score-instance">MII PR PRO Score Instance</span> | `QuestionnaireResponse.item`<br/>`Observation.value[x]` |  | Instrument noch nicht festgelegt. Im KDS-Modul PRO vorhanden: PROMIS Cognitive Function SF 4a. MoCA selbst wäre als PRO Score Instance (LOINC 72172-0) abbildbar. |

### Diagnosen und Prozeduren

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 39 | Aufnahmediagnose | MUSS | KDS-Profil direkt | [MII PR Diagnose Condition](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)<br/>[MII PR Fall Kontakt mit einer Gesundheitseinrichtung](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung) | `Condition.code`<br/>`Encounter.diagnosis.use` | ICD-10-GM; use = AD | Freitext über Condition.code.text. |
| 40 | Entlassdiagnose | MUSS | KDS-Profil direkt | [MII PR Diagnose Condition](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)<br/>[MII PR Fall Kontakt mit einer Gesundheitseinrichtung](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung) | `Condition.code`<br/>`Encounter.diagnosis.use` | ICD-10-GM; use = DD | Abteilungsentlassdiagnosen am Abteilungskontakt (department-main-diagnosis). |
| 41 | Nebendiagnosen | MUSS | KDS-Profil direkt | [MII PR Diagnose Condition](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)<br/>[MII PR Fall Kontakt mit einer Gesundheitseinrichtung](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung) | `Condition.code`<br/>`Encounter.diagnosis.use` | ICD-10-GM; use = CM |  |
| 42 | Vorerkrankungen | MUSS | KDS-Profil direkt | [MII PR Diagnose Condition](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose) | `Condition.code`<br/>`Condition.onset[x]` | ICD-10-GM | Abgrenzung über onset vor dem Aufenthalt; häufig in den Nebendiagnosen enthalten. |
| 43 | OPS (OP-Prozeduren) | MUSS | KDS-Profil direkt | [MII PR Prozedur Procedure](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure)<br/>[MII PR Onko Operation](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-operation) | `Procedure.code.coding:ops` | OPS; category SNOMED CT 387713003 | Tumoroperationen zusätzlich bzw. alternativ als Onko Operation. |
| NEU-2 | OP-Datum | MUSS | KDS-Profil direkt | [MII PR Prozedur Procedure](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure)<br/>[MII PR Onko Operation](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-operation) | `Procedure.performed[x]` |  |  |
| NEU-3 | Komplikationen | SOLL | KDS-Profil direkt | [MII PR Onko Operation](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-operation)<br/>[MII PR Prozedur Procedure](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure) | `Procedure.complication` | oBDS-Komplikationsliste bzw. ICD-10-GM | Re-OP als eigene Procedure (Onko Operation, Intention R = Revision/Komplikation). Auswahlliste im Katalog noch offen. |
| 44 | Chemotherapie, präoperativ | MUSS | KDS-Profil direkt | [MII PR Onko Systemische Therapie](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-systemische-therapie) | `Procedure.performed[x]`<br/>`Procedure.extension:StellungZurOp` | Art = CH; Stellung zur OP = N (neoadjuvant) |  |
| 45 | Strahlentherapie, präoperativ | MUSS | KDS-Profil direkt | [MII PR Onko Strahlentherapie](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-strahlentherapie) | `Procedure.performed[x]`<br/>`Procedure.extension:StellungZurOp` | Stellung zur OP = N (neoadjuvant) |  |
| 46 | Immuntherapie, präoperativ | MUSS | KDS-Profil direkt | [MII PR Onko Systemische Therapie](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-systemische-therapie)<br/>[MII PR Onko Systemische Therapie Medikation](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-systemische-therapie-medikation) | `Procedure.performed[x]`<br/>`Procedure.extension:StellungZurOp`<br/>`MedicationStatement.medication[x]` | Art = IM; Stellung zur OP = N | Substanzen als Onko Systemische Therapie Medikation. |

### Onkologie

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 47 | Karnofsky-Index | MUSS | KDS-Profil direkt | [MII PR Onko Allgemeiner Leistungszustand Karnofsky](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-allgemeiner-leistungszustand-karnofsky) | `Observation.value[x]` | SNOMED CT 761869008 | Mehrfacherhebung über effective[x]. |
| 48 | pTNM | MUSS | KDS-Profil direkt | [MII PR Onko TNM Klassifikation](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-klassifikation) | `Observation.value[x]`<br/>`Observation.hasMember` | code = SNOMED CT 399588009 (pathologisch) | T-, N- und M-Kategorie als eigene Observations des Onkologie-Moduls über hasMember. |
| 49 | ECOG-Score | MUSS | KDS-Profil direkt | [MII PR Onko Allgemeiner Leistungszustand ECOG](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-allgemeiner-leistungszustand-ecog) | `Observation.value[x]` | SNOMED CT 423740007 | Alternative zum Karnofsky-Index. |
| 50 | Histologie | MUSS | KDS-Profil direkt | [MII PR Onko Histologie ICD-O-3](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-histologie-icdo3)<br/><span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/StructureDefinition/mii-pr-patho-report">MII PR Patho Report</span> | `Observation.value[x]`<br/>`DiagnosticReport.conclusion` | ICD-O-3-Morphologie | Kodiert als Onko Histologie; der unstrukturierte Befundtext über den Pathologiebefund. |
| 51 | Grading | MUSS | KDS-Profil direkt | [MII PR Onko Grading](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-grading) | `Observation.value[x]` | LOINC 33732-9 |  |

### ICU-Scores

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 52 | CAM-ICU | MUSS | KDS-Profil direkt | [MII PR ICU Score CAM-ICU](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-score-cam-icu) | `Observation.value[x]:valueCodeableConcept` | SNOMED CT 450740000 | Der im Ballot-Profil fixierte LOINC-Code 99844-5 ist in LOINC 2.82 nicht enthalten (Ballot-Rückmeldung). |
| 53 | RASS | MUSS | KDS-Profil direkt | [MII PR ICU Score RASS](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-score-rass) | `Observation.value[x]` | SNOMED CT 1345050000 |  |
| 54 | NRS | SOLL | KDS-Profil direkt | [MII PR ICU Score Numerische Ratingskala](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-score-numerische-ratingskala) | `Observation.value[x]` | SNOMED CT 1284857008 |  |
| 55 | SOFA Score | MUSS | KDS-Profil direkt | [MII PR ICU Score SOFA](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-score-sofa) | `Observation.value[x]:valueInteger` | LOINC 96789-3 | Die sechs Teilscores sind im Profil verpflichtend. |

### Anästhesie und OP

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 56 | ASA | SOLL | KDS-Profil direkt | [MII PR Onko ASA Klassifikation](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-asa-klassifikation) | `Observation.value[x]` | LOINC 97816-3 |  |
| 57 | NYHA | SOLL | KDS-Profil direkt | <span title="https://www.medizininformatik-initiative.de/fhir/ext/modul-kardio/StructureDefinition/mii-pr-kardio-score-nyha">MII PR Kardio Score NYHA</span> | `Observation.value[x]` | LOINC 93124-6, SNOMED CT 762994006 |  |
| 58 | MET | MUSS | neues Profil | [DISTANCE:PRO PR Metabolisches Äquivalent](StructureDefinition-distance-pro-pr-met.html) | `Observation.value[x]:valueQuantity` | SNOMED CT 698834005; {MET} | Quelle (Anästhesie, Studienteam oder Wearable) über Observation.method bzw. device unterscheidbar. |
| 59 | OP-Dauer | MUSS | KDS-Profil direkt | [MII PR Prozedur Procedure](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure) | `Procedure.performed[x]:performedPeriod` |  | Dauer in Minuten wird aus Beginn und Ende berechnet. Onko Operation erlaubt nur einen Zeitpunkt. |
| 60 | Blutverlust | SOLL | KDS-Profil direkt | [MII PR ICU Bilanz Ausfuhr Blutverlust](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-bilanz-ausfuhr-blutverlust) | `Observation.value[x]` | LOINC 81661-1, SNOMED CT 250771004; mL |  |
| 61 | Blutransfusion | KANN | KDS-Profil direkt | [MII PR Prozedur Procedure](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure) | `Procedure.code` | OPS 8-800 ff.; SNOMED CT 116859006 | Art und Menge ergeben sich aus dem OPS-Kode; ja/nein aus dem Vorhandensein der Procedure. |

### ICU-Verlauf

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 62 | Katecholamintherapie | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Katecholamintherapie](StructureDefinition-distance-pro-pr-katecholamintherapie.html) | `MedicationAdministration.effective[x]`<br/>`MedicationAdministration.medication[x]` | ATC C01CA03, C01CA24, C01CA07, C01CA04 |  |
| 63 | Beatmungsdauer | MUSS | KDS-Profil direkt | [MII PR ICU Beatmung](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-beatmung) | `Procedure.performed[x]:performedPeriod` | category = SNOMED CT 40617009 | Reine Sauerstoffgabe: category = SNOMED CT 57485005. |
| 64 | Beatmungsform | SOLL | KDS-Profil direkt | [MII PR ICU Beatmung](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-beatmung) | `Procedure.code.coding:sct` | Wertemenge des ICU-Moduls | Auswahlliste im Katalog noch offen; je Phase eine Procedure. |
| 65 | Dialyse | MUSS | KDS-Profil direkt | [MII PR ICU Extrakorporales Verfahren](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-extrakorporales-verfahren) | `Procedure.performed[x]` | SNOMED CT 265764009 u. a. |  |
| 66 | Sedierung | SOLL | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Sedierung](StructureDefinition-distance-pro-pr-sedierung.html) | `MedicationAdministration.effective[x]`<br/>`MedicationAdministration.medication[x]` | ATC N01AX10, N05CD08, N05CM18 u. a. |  |
| 67 | 24 Stunden Flüssigkeitsbilanz | MUSS | KDS-Profil direkt | [MII PR ICU Bilanz Tagesbilanz Flüssigkeit](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-bilanz-tagesbilanz-fluessigkeit) | `Observation.value[x]` | LOINC 9097-7, SNOMED CT 251856003; mL | Bezugszeitraum über effectivePeriod. |
| 68 | Extubation | MUSS | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Postoperatives Ereignis](StructureDefinition-distance-pro-pr-postoperatives-ereignis.html) | `Procedure.performed[x]` | SNOMED CT 271280005 |  |
| 69 | Reintubation | SOLL | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Postoperatives Ereignis](StructureDefinition-distance-pro-pr-postoperatives-ereignis.html) | `Procedure.performed[x]` | SNOMED CT 112798008 | SNOMED CT kennt keine eigene Prozedur „Reintubation“: Intubation nach vorangegangener Extubation; ja/nein ist abgeleitet. |
| 70 | Erstmobilisation | SOLL | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Postoperatives Ereignis](StructureDefinition-distance-pro-pr-postoperatives-ereignis.html) | `Procedure.performed[x]` | SNOMED CT 370871008 | Erste dokumentierte Mobilisation bis in den Stand. Kodierung fachlich zu bestätigen. |
| 71 | Beginn oraler Kostaufbau | KANN | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Postoperatives Ereignis](StructureDefinition-distance-pro-pr-postoperatives-ereignis.html) | `Procedure.performed[x]` | SNOMED CT 448556005 | Kodierung fachlich zu bestätigen. |

### Vitaldaten

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 72 | Herzfrequenz (HF) | – | KDS-Profil direkt | [MII PR ICU MUV Herzfrequenz](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-muv-herzfrequenz) | `Observation.value[x]` | LOINC 8867-4; /min |  |
| 73 | intraarterieller systolischer Druck (SAP) | – | KDS-Profil direkt | [MII PR ICU MUV Arterieller Blutdruck](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-muv-arterieller-blutdruck) | `Observation.component:SystolicBP` | LOINC 8480-6; mm[Hg] | Invasive Messung über Observation.method bzw. bodySite kennzeichnen. |
| 74 | mittlerer Arterieller Druck (MAP) | – | KDS-Profil direkt | [MII PR ICU MUV Arterieller Blutdruck](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-muv-arterieller-blutdruck) | `Observation.component:meanBP` | LOINC 8478-0; mm[Hg] |  |
| 75 | diastolischer Druck (DAP) | – | KDS-Profil direkt | [MII PR ICU MUV Arterieller Blutdruck](https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-muv-arterieller-blutdruck) | `Observation.component:DiastolicBP` | LOINC 8462-4; mm[Hg] |  |
| 76 | SpO2 | – | ISiK-6-Profil (ICU-Linie) | [SD MII ICU Sauerstoffsättigung im arteriellen Blut durch Pulsoxymetrie (ISiK 6)](https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie) | `Observation.value[x]` | LOINC 59408-5; % | Profil des ICU-Moduls, das in der 2027er Linie unter ISiK 6 weitergeführt wird. |

### Blutgasanalyse

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 77 | paO2 | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 2703-7 | Einheit mmHg oder kPa als UCUM. |
| 78 | PaCO2 | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 2019-8 | Einheit mmHg oder kPa als UCUM. |
| 79 | pH arteriell | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 2744-1 |  |
| 80 | SaO2 | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 2708-6 |  |
| 81 | Laktat arteriell | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 2518-9 |  |
| 82 | Bicarbonat arteriell | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 1960-4 |  |
| 83 | SvO2 | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 2711-0, 19224-5 | Venös bzw. gemischtvenös. |
| 84 | BE arteriell | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 1925-7 |  |

### Laborwerte

| Nr. | Item | Relevanz | Abbildung | Profil | Element | Kodierung | Hinweis |
|---|---|---|---|---|---|---|---|
| 85 | Leukozyten | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 6690-2 |  |
| 86 | Thrombozyten | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 777-3 |  |
| 87 | Hämoglobin | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 718-7 |  |
| 88 | Hämatokrit | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 4544-3 |  |
| 89 | CRP | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 1988-5 |  |
| 90 | PCT | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 33959-8 |  |
| 91 | IL-6 | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 26881-3 |  |
| 92 | Harnstoff | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 3091-6, 22664-7 | Massen- bzw. Stoffmengenkonzentration. |
| 93 | Kreatinin | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 2160-0, 14682-9 | Massen- bzw. Stoffmengenkonzentration. |
| 94 | Bilirubin ges | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 1975-2, 14631-6 | Massen- bzw. Stoffmengenkonzentration. |
| 95 | Albumin | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 1751-7 |  |
| 96 | GOT | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 1920-8 |  |
| 97 | GPT | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 1742-6 |  |
| 98 | Troponin | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 67151-1, 89579-7, 6598-7, 10839-9 | Troponin T bzw. I, hochsensitiv bzw. konventionell – je nach Haus. |
| 99 | CK | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 2157-6 |  |
| 100 | CKMB | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 13969-1, 32673-6 | Masse bzw. Aktivität. |
| 101 | LDH | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 2532-0, 14804-9 |  |
| 102 | Amylase | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 1798-8 |  |
| 103 | Lipase | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 3040-3 |  |
| 104 | D-Dimere | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 48065-7, 48066-5 | FEU bzw. DDU. |
| 105 | INR | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 6301-6 |  |
| 106 | pTT | – | abgeleitet von KDS-Profil | [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | `Observation.value[x]` | LOINC 14979-9, 3173-2 |  |
