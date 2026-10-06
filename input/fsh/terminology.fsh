CodeSystem: DISTANCE_PRO_CS_Beobachtungen
Id: distance-pro-cs-beobachtungen
Title: "DISTANCE:PRO CS Beobachtungen"
Description: "Kodes für Erhebungsmerkmale der Studie DISTANCE:PRO, für die keine passenden Kodes in LOINC oder SNOMED CT vorliegen."
* ^experimental = false
* ^caseSensitive = true
* #hundehaltung "Hundehaltung" "Die Person hält einen Hund."
* #alkohol-risikobewertung "Risikobewertung des Alkoholkonsums" "Einstufung des Alkoholkonsums als risikoarm oder riskant nach der S3-Leitlinie zu alkoholbezogenen Störungen."

CodeSystem: DISTANCE_PRO_CS_Wohnsituation
Id: distance-pro-cs-wohnsituation
Title: "DISTANCE:PRO CS Wohnsituation"
Description: "Antwortmöglichkeiten zur Wohnsituation. Die Auswahlliste ist im Catalog of Items noch nicht abschließend festgelegt."
* ^experimental = false
* ^caseSensitive = true
* #haus "Haus"
* #wohnung "Wohnung"
* #betreutes-wohnen "Betreutes Wohnen"
* #pflegeeinrichtung "Pflegeeinrichtung"
* #sonstige "Sonstige Wohnform"

ValueSet: DISTANCE_PRO_VS_Wohnsituation
Id: distance-pro-vs-wohnsituation
Title: "DISTANCE:PRO VS Wohnsituation"
Description: "Antwortmöglichkeiten zur Wohnsituation (CoI-Item 16)."
* ^experimental = false
* include codes from system DISTANCE_PRO_CS_Wohnsituation

ValueSet: DISTANCE_PRO_VS_Lebenssituation
Id: distance-pro-vs-lebenssituation
Title: "DISTANCE:PRO VS Lebenssituation"
Description: "Antwortmöglichkeiten zur Lebenssituation (CoI-Item 15). Die Auswahlliste ist im Catalog of Items noch nicht abschließend festgelegt."
* ^experimental = false
* $sct#105529008 "Lives alone"
* $sct#408821002 "Lives with partner"
* $sct#224133007 "Lives with family"
* $sct#74964007 "Other"

ValueSet: DISTANCE_PRO_VS_Alkohol_Risikobewertung
Id: distance-pro-vs-alkohol-risikobewertung
Title: "DISTANCE:PRO VS Alkohol Risikobewertung"
Description: "Einstufung des Alkoholkonsums als risikoarm oder riskant (CoI-Item 22)."
* ^experimental = false
* $sct#428202005 "Alcohol intake within recommended daily limit"
* $sct#429775004 "Alcohol intake exceeds recommended daily limit"

ValueSet: DISTANCE_PRO_VS_Funktionelle_Therapien
Id: distance-pro-vs-funktionelle-therapien
Title: "DISTANCE:PRO VS Funktionelle Therapien"
Description: "Physiotherapie, Ergotherapie und Logopädie (CoI-Items 28–30)."
* ^experimental = false
* $sct#91251008 "Physical therapy procedure"
* $sct#84478008 "Occupational therapy"
* $sct#311555007 "Speech and language therapy regime"

ValueSet: DISTANCE_PRO_VS_Postoperative_Ereignisse
Id: distance-pro-vs-postoperative-ereignisse
Title: "DISTANCE:PRO VS Postoperative Ereignisse"
Description: "Zeitlich zu dokumentierende Ereignisse des postoperativen Verlaufs: Extubation, (Re-)Intubation, Erstmobilisation und Beginn des oralen Kostaufbaus (CoI-Items 68–71)."
* ^experimental = false
* $sct#271280005 "Removal of endotracheal tube"
* $sct#112798008 "Insertion of endotracheal tube"
* $sct#370871008 "Ambulation therapy"
* $sct#448556005 "Oral nutritional support"

ValueSet: DISTANCE_PRO_VS_Rehabilitation_Setting
Id: distance-pro-vs-rehabilitation-setting
Title: "DISTANCE:PRO VS Rehabilitation Setting"
Description: "Ambulante oder stationäre Rehabilitation (CoI-Item 31)."
* ^experimental = false
* $v3-act#AMB "ambulatory"
* $v3-act#IMP "inpatient encounter"

ValueSet: DISTANCE_PRO_VS_Katecholamine
Id: distance-pro-vs-katecholamine
Title: "DISTANCE:PRO VS Katecholamine"
Description: "Adrenerge und dopaminerge Mittel der ATC-Gruppe C01CA, z. B. Noradrenalin (C01CA03), Adrenalin (C01CA24), Dobutamin (C01CA07) und Dopamin (C01CA04) (CoI-Item 62)."
* ^experimental = false
* include codes from system $atc where concept is-a #C01CA

ValueSet: DISTANCE_PRO_VS_Sedativa
Id: distance-pro-vs-sedativa
Title: "DISTANCE:PRO VS Sedativa"
Description: "Zur kontinuierlichen Sedierung eingesetzte Wirkstoffe: Allgemeinanästhetika (ATC N01A, z. B. Propofol N01AX10), Hypnotika und Sedativa (ATC N05C, z. B. Midazolam N05CD08, Dexmedetomidin N05CM18) sowie Clonidin (CoI-Item 66)."
* ^experimental = false
* include codes from system $atc where concept is-a #N01A
* include codes from system $atc where concept is-a #N05C
* $atc#C02AC01 "Clonidin"
