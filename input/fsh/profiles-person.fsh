Profile: DISTANCE_PRO_PR_BMI
Parent: $core-bmi
Id: distance-pro-pr-bmi
Title: "DISTANCE:PRO PR BMI"
Description: "Body-Mass-Index, berechnet aus Körpergröße und Körpergewicht (CoI-Item 11). Der MII Kerndatensatz 2027 enthält kein BMI-Profil; dieses Profil setzt auf dem Vitalzeichenprofil der FHIR-Kernspezifikation auf."
// Das Core-Profil verlangt den Slice BMICode, lässt coding selbst aber 0..* – der Publisher meldet das als Fehler
* code.coding 1..*
* subject only Reference(Patient)
* derivedFrom MS
* derivedFrom ^short = "Körpergröße und Körpergewicht, aus denen der BMI berechnet wurde"

Profile: DISTANCE_PRO_PR_Alter
Parent: Observation
Id: distance-pro-pr-alter
Title: "DISTANCE:PRO PR Alter bei Einschluss"
Description: "Alter in vollendeten Lebensjahren zum Zeitpunkt des Studieneinschlusses (CoI-Item 14). Wird benötigt, weil das Geburtsdatum im pseudonymisierten Forschungsdatensatz nicht exakt vorliegt."
* status MS
* code MS
* code = $loinc#30525-0
* subject 1..1 MS
* subject only Reference(Patient)
* effective[x] 1..1 MS
* effective[x] only dateTime
* effective[x] ^short = "Zeitpunkt des Studieneinschlusses"
* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity.value 1..1 MS
* valueQuantity.unit MS
* valueQuantity.system 1..1 MS
* valueQuantity.system = $ucum
* valueQuantity.code 1..1 MS
* valueQuantity.code = #a

Profile: DISTANCE_PRO_PR_Gewichtsverlust
Parent: Observation
Id: distance-pro-pr-gewichtsverlust
Title: "DISTANCE:PRO PR Gewichtsverlust"
Description: "Vom Patienten berichteter Gewichtsverlust in Kilogramm (CoI-Item 13)."
* status MS
* code MS
* code = $sct#89362005
* subject 1..1 MS
* subject only Reference(Patient)
* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* effective[x] ^short = "Erhebungszeitpunkt oder Zeitraum, auf den sich der Gewichtsverlust bezieht"
* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity.value 1..1 MS
* valueQuantity.unit MS
* valueQuantity.system 1..1 MS
* valueQuantity.system = $ucum
* valueQuantity.code 1..1 MS
* valueQuantity.code = #kg

Profile: DISTANCE_PRO_PR_MET
Parent: Observation
Id: distance-pro-pr-met
Title: "DISTANCE:PRO PR Metabolisches Äquivalent"
Description: "Körperliche Belastbarkeit als metabolisches Äquivalent (MET) (CoI-Item 58)."
* status MS
* code MS
* code = $sct#698834005
* subject 1..1 MS
* subject only Reference(Patient)
* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity.value 1..1 MS
* valueQuantity.unit MS
* valueQuantity.system 1..1 MS
* valueQuantity.system = $ucum
* valueQuantity.code 1..1 MS
* valueQuantity.code = #{MET}
* method MS
* method ^short = "Art der Ermittlung, z. B. anästhesiologische Einschätzung, Befragung oder Wearable"
