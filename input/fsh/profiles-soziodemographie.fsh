Profile: DISTANCE_PRO_PR_Lebenssituation
Parent: $mii-sdd-lebenssituation
Id: distance-pro-pr-lebenssituation
Title: "DISTANCE:PRO PR Lebenssituation"
Description: "Mit wem die Person zusammenlebt (CoI-Item 15)."
* code = $loinc#46468-5
* value[x] 1..1 MS
* value[x] only CodeableConcept
* value[x] from DISTANCE_PRO_VS_Lebenssituation (extensible)

Profile: DISTANCE_PRO_PR_Wohnsituation
Parent: $mii-sdd-lebenssituation
Id: distance-pro-pr-wohnsituation
Title: "DISTANCE:PRO PR Wohnsituation"
Description: "Wohnform der Person, z. B. Haus, Wohnung oder Pflegeeinrichtung (CoI-Item 16)."
* code = $loinc#71802-3
* value[x] 1..1 MS
* value[x] only CodeableConcept
* value[x] from DISTANCE_PRO_VS_Wohnsituation (extensible)

Profile: DISTANCE_PRO_PR_Hundehaltung
Parent: $mii-sdd-lebenssituation
Id: distance-pro-pr-hundehaltung
Title: "DISTANCE:PRO PR Hundehaltung"
Description: "Angabe, ob die Person einen Hund hält (CoI-Item 17)."
* code = DISTANCE_PRO_CS_Beobachtungen#hundehaltung
* value[x] 1..1 MS
* value[x] only CodeableConcept
* value[x] from $vs-ja-nein (required)

Profile: DISTANCE_PRO_PR_Soziale_Unterstuetzung
Parent: $mii-sdd-soziooekonomische-faktoren
Id: distance-pro-pr-soziale-unterstuetzung
Title: "DISTANCE:PRO PR Soziale Unterstützung"
Description: "Freitextliche Beschreibung der Unterstützung durch das soziale Umfeld, z. B. Nachbarn, Freunde oder weitere Familienangehörige (CoI-Item 18)."
* code = $sct#405076007
* value[x] 1..1 MS
* value[x] only string

Profile: DISTANCE_PRO_PR_Alkoholkonsum
Parent: Observation
Id: distance-pro-pr-alkoholkonsum
Title: "DISTANCE:PRO PR Alkoholkonsum"
Description: "Alkoholkonsum der Person (CoI-Items 21 und 22): Konsum ja/nein sowie optional die Menge an Reinalkohol pro Tag oder die Einstufung als risikoarm bzw. riskant."
* status MS
* category 1..1 MS
* category = $obs-cat#social-history
* code MS
* code = $loinc#11331-6
* subject 1..1 MS
* subject only Reference(Patient)
* effective[x] 1..1 MS
* effective[x] only dateTime
* value[x] 1..1 MS
* value[x] only CodeableConcept
* value[x] from $vs-ja-nein (required)
* value[x] ^short = "Alkoholkonsum ja/nein"
* component MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains reinalkohol 0..1 MS and risikobewertung 0..1 MS
* component[reinalkohol] ^short = "Reinalkohol in Gramm pro Tag"
* component[reinalkohol].code = $sct#896810008
* component[reinalkohol].value[x] 1..1 MS
* component[reinalkohol].value[x] only Quantity
* component[reinalkohol].valueQuantity.value 1..1 MS
* component[reinalkohol].valueQuantity.system 1..1 MS
* component[reinalkohol].valueQuantity.system = $ucum
* component[reinalkohol].valueQuantity.code 1..1 MS
* component[reinalkohol].valueQuantity.code = #g/d
* component[risikobewertung] ^short = "Einstufung als risikoarm oder riskant"
* component[risikobewertung].code = DISTANCE_PRO_CS_Beobachtungen#alkohol-risikobewertung
* component[risikobewertung].value[x] 1..1 MS
* component[risikobewertung].value[x] only CodeableConcept
* component[risikobewertung].value[x] from DISTANCE_PRO_VS_Alkohol_Risikobewertung (required)
