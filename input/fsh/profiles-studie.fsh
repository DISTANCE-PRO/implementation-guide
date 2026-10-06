Extension: DISTANCE_PRO_EX_Studienzentrum
Id: distance-pro-ex-studienzentrum
Title: "DISTANCE:PRO EX Studienzentrum"
Description: "Studienzentrum, an dem die Probandin bzw. der Proband eingeschlossen wurde (CoI-Item 8). Das Zentrum wird über seine Studienzentrumsnummer identifiziert."
Context: ResearchSubject
* value[x] only Reference(Organization)
* value[x] 1..1
* valueReference.identifier 1..1 MS
* valueReference.identifier ^short = "Studienzentrumsnummer"
* valueReference.identifier.system 1..1 MS
* valueReference.identifier.value 1..1 MS
* valueReference.identifier.value ^short = "Nummer des Studienzentrums (1–10)"

Profile: DISTANCE_PRO_PR_Proband
Parent: $mii-proband
Id: distance-pro-pr-proband
Title: "DISTANCE:PRO PR Proband"
Description: "Teilnahme einer Person an der Studie DISTANCE:PRO mit Studien-ID (CoI-Item 7) und Studienzentrum (CoI-Item 8)."
* extension contains DISTANCE_PRO_EX_Studienzentrum named studienzentrum 1..1 MS
* identifier[subjectIdentificationCode] ^short = "Studien-ID"
* identifier[subjectIdentificationCode] ^definition = "Vom Studien- bzw. Technikteam vergebene Studien-ID, z. B. 001-PAT-001."
* assignedArm MS
* assignedArm ^short = "Studienarm (Intervention oder Kontrolle)"
