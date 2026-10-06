Die folgenden Punkte ergeben sich aus dem Katalog selbst oder aus der Abbildung auf den Kerndatensatz. Sie sollten vor einer Umsetzung geklärt werden.

### Aus dem Catalog of Items

| Nr. | Item | Offener Punkt |
|---|---|---|
| 5, 6 | Fallnummer, Pat.-ID | Das Pseudonymisierungsverfahren ist im Katalog noch offen. Der IG sieht pseudonymisierte Identifier nach *MII PR Person Patient (Pseudonymisiert)* vor. |
| 7 | Studien-ID | Das Format ist noch festzulegen; ebenso die Namensräume (`system`) für Studien-ID und Studienzentrumsnummer. Die in den Beispielen verwendeten URLs sind Platzhalter. |
| 15, 16 | Lebenssituation, Wohnsituation | Die Auswahllisten sind im Katalog nur angedeutet. Die ValueSets dieses IG sind ein Vorschlag und deshalb nur *extensible* gebunden. |
| 22 | Alkohol – wie viel? | Der Katalog lässt Reinalkohol oder die Einstufung riskant/nicht riskant zu. Das Profil erlaubt beides; eine Festlegung vereinfacht die Auswertung. |
| 32 | Aktuelle Berufstätigkeit | Der Teilzeitanteil in Prozent ist im KDS-Profil *Beschäftigungsstatus* nicht vorgesehen. Wird er benötigt, ist ein abgeleitetes Profil zu ergänzen. |
| 33, 47, 49 | Karnofsky-Index, ECOG | Item 33 und 47 sind inhaltlich gleich. Zu entscheiden ist, ob Karnofsky, ECOG oder beide erhoben werden. |
| 37 | NRS | Der Katalog nennt den Wertebereich 1–10, das KDS-Profil erlaubt 0–10. Bezugszeitraum (akut oder letzte zwei Wochen) und Lokalisation sind noch nicht festgelegt. |
| 38 | Alternative für MoCA | Das Instrument steht noch nicht fest. Das KDS-Modul PRO enthält *PROMIS Cognitive Function SF 4a*; MoCA selbst ließe sich als *PRO Score Instance* abbilden. |
| 52, 58 | CAM-ICU, MET | Im Katalog als „Entweder-oder“ mit offener Alternative gekennzeichnet. |
| 64 | Beatmungsform | Die Auswahlliste ist noch vorzugeben. Das ICU-Modul liefert ein umfangreiches SNOMED-CT-ValueSet; eine Studienauswahl daraus steht aus. |
| NEU-3 | Komplikationen | Die Auswahlliste ist offen. Für Tumoroperationen bietet das Onkologie-Modul die oBDS-Komplikationsliste. |
| 77–106 | Blutgasanalyse, Laborwerte | Erhebungszeiträume sind noch festzulegen. Einheiten unterscheiden sich je Haus; sie sind als UCUM zu übermitteln. Die LOINC-Kodes im ValueSet decken die üblichen Varianten ab und sind mit den Laboren der Zentren abzugleichen. |
{: .grid}

### Aus der Abbildung auf den Kerndatensatz

| Thema | Offener Punkt |
|---|---|
| Canonical und Package-Id | `https://www.medizininformatik-initiative.de/fhir/distance-pro` und `de.distance.pro` sind vorläufig. |
| Ballot-Stand | Der KDS 2027 befindet sich in der Ballotierung. Nach der finalen Veröffentlichung sind die Abhängigkeiten anzuheben und die Abbildung zu prüfen. |
| CAM-ICU | Das Ballot-Profil fixiert den LOINC-Kode 99844-5, der in LOINC 2.82 nicht enthalten ist. Der Punkt sollte in die Ballotierung des ICU-Moduls zurückgemeldet werden. |
| SOFA | Das Ballot-Profil verlangt alle sechs Teilscores und enthält für deren SNOMED-CT-Kodes noch Platzhalter. Liegt nur der Gesamtscore vor, ist das Profil derzeit nicht erfüllbar. |
| Erstmobilisation, Kostaufbau | SNOMED CT bietet keine exakt passenden Prozeduren. Die gewählten Kodes (*Ambulation therapy*, *Oral nutritional support*) sind fachlich zu bestätigen. |
| Reintubation | SNOMED CT kennt keine eigene Prozedur. Abgebildet wird die Intubation; die Reintubation ergibt sich aus der zeitlichen Abfolge nach einer Extubation. |
| Histologie | Der unstrukturierte Befundtext passt nicht in das kodierte Profil *Onko Histologie ICD-O-3* und wird deshalb über den Pathologiebefund geführt. |
| OP-Dauer | *Onko Operation* erlaubt nur einen Zeitpunkt. Für die OP-Dauer ist die Operation zusätzlich oder stattdessen als *MII PR Prozedur Procedure* mit Zeitraum zu führen. |
| Vitaldaten | Der Katalog nennt kontinuierliche Erhebung. Abtastrate bzw. Aggregation (z. B. Stundenwerte) sind festzulegen. |
{: .grid}
