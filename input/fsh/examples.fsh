// Beispiele mit frei erfundenen Daten.

Instance: distance-pro-beispiel-studie
InstanceOf: $mii-studie
Usage: #example
Title: "Beispiel Studie DISTANCE:PRO"
Description: "Die Studie DISTANCE:PRO als ResearchStudy."
* status = #active
* title = "DISTANCE:PRO"

Instance: distance-pro-beispiel-patient
InstanceOf: $mii-patient-pseudo
Usage: #example
Title: "Beispiel Patientin (pseudonymisiert)"
Description: "Pseudonymisierte Patientin des Forschungsdatensatzes."
* identifier[PseudonymisierterIdentifier].system = $sid-pseudonym
* identifier[PseudonymisierterIdentifier].value = "7Q2K-93HF-ZT41"
* gender = #female
* birthDate = "1958"

Instance: distance-pro-beispiel-proband
InstanceOf: DISTANCE_PRO_PR_Proband
Usage: #example
Title: "Beispiel Probandin"
Description: "Studienteilnahme mit Studien-ID und Studienzentrum (CoI-Items 7 und 8)."
* extension[studienzentrum].valueReference.identifier.system = $sid-studienzentrum
* extension[studienzentrum].valueReference.identifier.value = "1"
* identifier[subjectIdentificationCode].type = $v2-0203#ANON
* identifier[subjectIdentificationCode].system = $sid-studien-id
* identifier[subjectIdentificationCode].value = "001-PAT-001"
* status = #on-study
* period.start = "2026-11-02"
* study = Reference(distance-pro-beispiel-studie)
* individual = Reference(distance-pro-beispiel-patient)
* assignedArm = "Intervention"
* consent.display = "Einwilligungserklärung DISTANCE:PRO vom 02.11.2026"

Instance: distance-pro-beispiel-bmi
InstanceOf: DISTANCE_PRO_PR_BMI
Usage: #example
Title: "Beispiel BMI"
Description: "BMI bei Einschluss (CoI-Item 11)."
* status = #final
* category[VSCat] = $obs-cat#vital-signs
* code.coding[BMICode] = $loinc#39156-5
* subject = Reference(distance-pro-beispiel-patient)
* effectiveDateTime = "2026-11-02"
* valueQuantity = 24.2 'kg/m2' "kg/m2"

Instance: distance-pro-beispiel-alter
InstanceOf: DISTANCE_PRO_PR_Alter
Usage: #example
Title: "Beispiel Alter bei Einschluss"
Description: "Alter bei Einschluss (CoI-Item 14)."
* status = #final
* subject = Reference(distance-pro-beispiel-patient)
* effectiveDateTime = "2026-11-02"
* valueQuantity = 68 'a' "Jahre"

Instance: distance-pro-beispiel-gewichtsverlust
InstanceOf: DISTANCE_PRO_PR_Gewichtsverlust
Usage: #example
Title: "Beispiel Gewichtsverlust"
Description: "Berichteter Gewichtsverlust in den sechs Monaten vor Einschluss (CoI-Item 13)."
* status = #final
* subject = Reference(distance-pro-beispiel-patient)
* effectivePeriod.start = "2026-05-02"
* effectivePeriod.end = "2026-11-02"
* valueQuantity = 4 'kg' "kg"

Instance: distance-pro-beispiel-met
InstanceOf: DISTANCE_PRO_PR_MET
Usage: #example
Title: "Beispiel Metabolisches Äquivalent"
Description: "Präoperative Belastbarkeit laut Anästhesieprotokoll (CoI-Item 58)."
* status = #final
* subject = Reference(distance-pro-beispiel-patient)
* effectiveDateTime = "2026-11-09"
* valueQuantity = 4 '{MET}' "MET"
* method.text = "Anästhesiologische Einschätzung"

Instance: distance-pro-beispiel-lebenssituation
InstanceOf: DISTANCE_PRO_PR_Lebenssituation
Usage: #example
Title: "Beispiel Lebenssituation"
Description: "Lebt mit Partner (CoI-Item 15)."
* status = #final
* subject = Reference(distance-pro-beispiel-patient)
* effectiveDateTime = "2026-11-02"
* valueCodeableConcept = $sct#408821002

Instance: distance-pro-beispiel-wohnsituation
InstanceOf: DISTANCE_PRO_PR_Wohnsituation
Usage: #example
Title: "Beispiel Wohnsituation"
Description: "Wohnt in einer Wohnung (CoI-Item 16)."
* status = #final
* subject = Reference(distance-pro-beispiel-patient)
* effectiveDateTime = "2026-11-02"
* valueCodeableConcept = DISTANCE_PRO_CS_Wohnsituation#wohnung

Instance: distance-pro-beispiel-hundehaltung
InstanceOf: DISTANCE_PRO_PR_Hundehaltung
Usage: #example
Title: "Beispiel Hundehaltung"
Description: "Hält einen Hund (CoI-Item 17)."
* status = #final
* subject = Reference(distance-pro-beispiel-patient)
* effectiveDateTime = "2026-11-02"
* valueCodeableConcept = $v2-0532#Y

Instance: distance-pro-beispiel-soziale-unterstuetzung
InstanceOf: DISTANCE_PRO_PR_Soziale_Unterstuetzung
Usage: #example
Title: "Beispiel Soziale Unterstützung"
Description: "Freitext zum sozialen Umfeld (CoI-Item 18)."
* status = #final
* subject = Reference(distance-pro-beispiel-patient)
* effectiveDateTime = "2026-11-02"
* valueString = "Tochter wohnt im selben Ort, Nachbarin hilft beim Einkaufen."

Instance: distance-pro-beispiel-alkoholkonsum
InstanceOf: DISTANCE_PRO_PR_Alkoholkonsum
Usage: #example
Title: "Beispiel Alkoholkonsum"
Description: "Alkoholkonsum mit Menge und Risikobewertung (CoI-Items 21 und 22)."
* status = #final
* subject = Reference(distance-pro-beispiel-patient)
* effectiveDateTime = "2026-11-02"
* valueCodeableConcept = $v2-0532#Y
* component[reinalkohol].valueQuantity = 10 'g/d' "g/d"
* component[risikobewertung].valueCodeableConcept = $sct#428202005

Instance: distance-pro-beispiel-physiotherapie
InstanceOf: DISTANCE_PRO_PR_Funktionelle_Therapie
Usage: #example
Title: "Beispiel Physiotherapie"
Description: "Physiotherapie im Verlauf (CoI-Item 28)."
* status = #completed
* code.coding[sct] = $sct#91251008
* subject = Reference(distance-pro-beispiel-patient)
* performedPeriod.start = "2026-12-01"
* performedPeriod.end = "2027-01-15"

Instance: distance-pro-beispiel-extubation
InstanceOf: DISTANCE_PRO_PR_Postoperatives_Ereignis
Usage: #example
Title: "Beispiel Extubation"
Description: "Extubation auf der Intensivstation (CoI-Item 68)."
* status = #completed
* code.coding[sct] = $sct#271280005
* subject = Reference(distance-pro-beispiel-patient)
* performedDateTime = "2026-11-10T18:40:00+01:00"

Instance: distance-pro-beispiel-rehabilitation
InstanceOf: DISTANCE_PRO_PR_Rehabilitation
Usage: #example
Title: "Beispiel Rehabilitation"
Description: "Stationäre Rehabilitation mit Dauer (CoI-Items 31 und NEU-1)."
* status = #finished
* class = $v3-act#IMP
* subject = Reference(distance-pro-beispiel-patient)
* period.start = "2026-12-01"
* period.end = "2026-12-22"

Instance: distance-pro-beispiel-katecholamintherapie
InstanceOf: DISTANCE_PRO_PR_Katecholamintherapie
Usage: #example
Title: "Beispiel Katecholamintherapie"
Description: "Kontinuierliche Gabe von Noradrenalin (CoI-Item 62)."
* status = #completed
* medicationCodeableConcept.coding[atcClassDe] = $atc#C01CA03
* medicationCodeableConcept.text = "Noradrenalin"
* subject = Reference(distance-pro-beispiel-patient)
* effectivePeriod.start = "2026-11-10T14:05:00+01:00"
* effectivePeriod.end = "2026-11-11T06:30:00+01:00"

Instance: distance-pro-beispiel-sedierung
InstanceOf: DISTANCE_PRO_PR_Sedierung
Usage: #example
Title: "Beispiel Sedierung"
Description: "Kontinuierliche Gabe von Propofol (CoI-Item 66)."
* status = #completed
* medicationCodeableConcept.coding[atcClassDe] = $atc#N01AX10
* medicationCodeableConcept.text = "Propofol"
* subject = Reference(distance-pro-beispiel-patient)
* effectivePeriod.start = "2026-11-10T13:30:00+01:00"
* effectivePeriod.end = "2026-11-10T17:55:00+01:00"

Instance: distance-pro-beispiel-crp
InstanceOf: DISTANCE_PRO_PR_Laboruntersuchung
Usage: #example
Title: "Beispiel Laborwert CRP"
Description: "CRP am ersten postoperativen Tag (CoI-Item 89)."
* identifier[analyseBefundCode].system = $sid-befund
* identifier[analyseBefundCode].value = "L-2026-0001-CRP"
* identifier[analyseBefundCode].assigner.display = "Zentrallabor"
* status = #final
* code.coding[loinc] = $loinc#1988-5
* subject = Reference(distance-pro-beispiel-patient)
* effectiveDateTime = "2026-11-11T06:10:00+01:00"
* valueQuantity = 87.4 'mg/L' "mg/L"

// Beispiele für die direkte Nutzung von KDS-Profilen

Instance: distance-pro-beispiel-karnofsky
InstanceOf: $mii-onko-karnofsky
Usage: #example
Title: "Beispiel Karnofsky-Index"
Description: "Karnofsky-Index bei Einschluss über das Onkologie-Modul des KDS (CoI-Items 33 und 47)."
* status = #final
* subject = Reference(distance-pro-beispiel-patient)
* effectiveDateTime = "2026-11-02"
* valueCodeableConcept.coding[obds] = $onko-karnofsky#80%

Instance: distance-pro-beispiel-chemotherapie-praeoperativ
InstanceOf: $mii-onko-systemische-therapie
Usage: #example
Title: "Beispiel Chemotherapie, präoperativ"
Description: "Neoadjuvante Chemotherapie über das Onkologie-Modul des KDS (CoI-Item 44)."
* extension[Intention].valueCodeableConcept = $onko-intention#K
* extension[StellungZurOp].valueCodeableConcept = $onko-stellung-op#N
* status = #completed
* code.coding[sct] = $sct#367336001
* code.coding[systemische_therapie_art] = $onko-therapie-typ#CH
* subject = Reference(distance-pro-beispiel-patient)
* performedPeriod.start = "2026-07-06"
* performedPeriod.end = "2026-09-28"

Instance: distance-pro-beispiel-beatmung
InstanceOf: $mii-icu-beatmung
Usage: #example
Title: "Beispiel Beatmung"
Description: "Invasive Beatmung mit Beginn und Ende über das ICU-Modul des KDS (CoI-Items 63 und 64)."
* status = #completed
* category.coding[sct] = $sct#40617009
* code.coding[sct] = $sct#1149092001
* subject = Reference(distance-pro-beispiel-patient)
* performedPeriod.start = "2026-11-10T09:15:00+01:00"
* performedPeriod.end = "2026-11-10T18:40:00+01:00"
