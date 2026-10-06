// Terminologien
Alias: $loinc = http://loinc.org
Alias: $sct = http://snomed.info/sct
Alias: $ucum = http://unitsofmeasure.org
Alias: $atc = http://fhir.de/CodeSystem/bfarm/atc
Alias: $obs-cat = http://terminology.hl7.org/CodeSystem/observation-category
// Das ValueSet v2-0136 (ja/nein) zieht seine Kodes seit THO 7 aus v2-0532
Alias: $v2-0532 = http://terminology.hl7.org/CodeSystem/v2-0532
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $v3-act = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $v3-obs-value = http://terminology.hl7.org/CodeSystem/v3-ObservationValue
Alias: $vs-ja-nein = http://terminology.hl7.org/ValueSet/v2-0136
Alias: $onko-intention = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention
Alias: $onko-stellung-op = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-stellungzurop
Alias: $onko-therapie-typ = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-typ
Alias: $onko-karnofsky = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-allgemeiner-leistungszustand-karnofsky

// Profile des MII Kerndatensatzes 2027. Bewusst per Canonical referenziert: ISiK 6
// führt einige ICU-Profile unter gleichem Namen, aber anderem Canonical.
Alias: $mii-patient-pseudo = https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert
Alias: $mii-encounter = https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung
Alias: $mii-procedure = https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure
Alias: $mii-medication-administration = https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/MedicationAdministration
Alias: $mii-observation-lab = https://www.medizininformatik-initiative.de/fhir/core/modul-labor/StructureDefinition/ObservationLab
Alias: $mii-studie = https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-pr-studie-studie
Alias: $mii-proband = https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-pr-studie-proband
Alias: $mii-sdd-lebenssituation = https://www.medizininformatik-initiative.de/fhir/ext/modul-soziodemographie/StructureDefinition/mii-pr-sdd-lebenssituation
Alias: $mii-sdd-soziooekonomische-faktoren = https://www.medizininformatik-initiative.de/fhir/ext/modul-soziodemographie/StructureDefinition/mii-pr-sdd-soziooekonomische-faktoren
Alias: $mii-icu-beatmung = https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-beatmung
Alias: $mii-onko-karnofsky = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-allgemeiner-leistungszustand-karnofsky
Alias: $mii-onko-systemische-therapie = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-systemische-therapie
Alias: $core-bmi = http://hl7.org/fhir/StructureDefinition/bmi

// Identifier-Namensräume der Studie (vorläufig)
Alias: $sid-studien-id = https://www.medizininformatik-initiative.de/fhir/distance-pro/sid/studien-id
Alias: $sid-studienzentrum = https://www.medizininformatik-initiative.de/fhir/distance-pro/sid/studienzentrum
Alias: $sid-pseudonym = https://www.medizininformatik-initiative.de/fhir/distance-pro/sid/pseudonym
Alias: $sid-befund = https://www.medizininformatik-initiative.de/fhir/distance-pro/sid/laborbefund
