Profile: DISTANCE_PRO_PR_Funktionelle_Therapie
Parent: $mii-procedure
Id: distance-pro-pr-funktionelle-therapie
Title: "DISTANCE:PRO PR Funktionelle Therapie"
Description: "Physiotherapie, Ergotherapie oder Logopädie im Therapieverlauf mit Zeitpunkt bzw. Zeitraum (CoI-Items 28–30)."
* code.coding[sct] 1..1 MS
* code.coding[sct] from DISTANCE_PRO_VS_Funktionelle_Therapien (required)

Profile: DISTANCE_PRO_PR_Postoperatives_Ereignis
Parent: $mii-procedure
Id: distance-pro-pr-postoperatives-ereignis
Title: "DISTANCE:PRO PR Postoperatives Ereignis"
Description: "Zeitpunkt eines Ereignisses im postoperativen Verlauf: Extubation, (Re-)Intubation, Erstmobilisation oder Beginn des oralen Kostaufbaus (CoI-Items 68–71)."
* code.coding[sct] 1..1 MS
* code.coding[sct] from DISTANCE_PRO_VS_Postoperative_Ereignisse (required)
* performed[x] only dateTime

Profile: DISTANCE_PRO_PR_Rehabilitation
Parent: $mii-encounter
Id: distance-pro-pr-rehabilitation
Title: "DISTANCE:PRO PR Rehabilitation"
Description: "Aufenthalt bzw. Behandlung in einem Rehabilitationszentrum mit Setting (ambulant oder stationär) und Dauer (CoI-Items 31 und NEU-1)."
* class from DISTANCE_PRO_VS_Rehabilitation_Setting (required)
* type contains Rehabilitation 1..1 MS
* type[Rehabilitation] = $sct#52052004
* period 1..1
* period.start 1..1

Profile: DISTANCE_PRO_PR_Katecholamintherapie
Parent: $mii-medication-administration
Id: distance-pro-pr-katecholamintherapie
Title: "DISTANCE:PRO PR Katecholamintherapie"
Description: "Kontinuierliche intravenöse Gabe eines Katecholamins mit Wirkstoff und Zeitraum (CoI-Item 62)."
* medication[x] only CodeableConcept
* medicationCodeableConcept.coding[atcClassDe] 1..* MS
* medicationCodeableConcept.coding[atcClassDe] from DISTANCE_PRO_VS_Katecholamine (required)
* effective[x] only Period
* effectivePeriod.start 1..1 MS
* effectivePeriod.end MS

Profile: DISTANCE_PRO_PR_Sedierung
Parent: $mii-medication-administration
Id: distance-pro-pr-sedierung
Title: "DISTANCE:PRO PR Sedierung"
Description: "Kontinuierliche Gabe eines sedierenden Medikaments mit Wirkstoff und Zeitraum (CoI-Item 66)."
* medication[x] only CodeableConcept
* medicationCodeableConcept.coding[atcClassDe] 1..* MS
* medicationCodeableConcept.coding[atcClassDe] from DISTANCE_PRO_VS_Sedativa (required)
* effective[x] only Period
* effectivePeriod.start 1..1 MS
* effectivePeriod.end MS

Profile: DISTANCE_PRO_PR_Laboruntersuchung
Parent: $mii-observation-lab
Id: distance-pro-pr-laboruntersuchung
Title: "DISTANCE:PRO PR Laboruntersuchung"
Description: "Blutgas- oder Laborwert aus dem Parameterumfang der Studie DISTANCE:PRO (CoI-Items 77–106)."
* code from DISTANCE_PRO_VS_Laborparameter (extensible)
* code.coding[loinc] 1..* MS
