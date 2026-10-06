Die folgenden Artefakte werden in diesem IG definiert. Alle übrigen Items des Katalogs nutzen Profile des MII Kerndatensatzes unverändert (siehe [Mapping](mapping.html)).

### Von KDS-Profilen abgeleitete Profile

Diese Profile schränken ein KDS-Profil für den Zweck der Studie weiter ein. Daten, die ihnen entsprechen, sind zugleich konform zum jeweiligen KDS-Profil.

| Profil | Abgeleitet von | CoI-Items |
|---|---|---|
| [DISTANCE:PRO PR Proband](StructureDefinition-distance-pro-pr-proband.html) | MII PR Studie Proband | 7, 8 |
| [DISTANCE:PRO PR Lebenssituation](StructureDefinition-distance-pro-pr-lebenssituation.html) | MII PR SDD Lebenssituation | 15 |
| [DISTANCE:PRO PR Wohnsituation](StructureDefinition-distance-pro-pr-wohnsituation.html) | MII PR SDD Lebenssituation | 16 |
| [DISTANCE:PRO PR Hundehaltung](StructureDefinition-distance-pro-pr-hundehaltung.html) | MII PR SDD Lebenssituation | 17 |
| [DISTANCE:PRO PR Soziale Unterstützung](StructureDefinition-distance-pro-pr-soziale-unterstuetzung.html) | MII PR SDD Sozioökonomische Faktoren | 18 |
| [DISTANCE:PRO PR Funktionelle Therapie](StructureDefinition-distance-pro-pr-funktionelle-therapie.html) | MII PR Prozedur Procedure | 28–30 |
| [DISTANCE:PRO PR Rehabilitation](StructureDefinition-distance-pro-pr-rehabilitation.html) | MII PR Fall Kontakt mit einer Gesundheitseinrichtung | 31, NEU-1 |
| [DISTANCE:PRO PR Katecholamintherapie](StructureDefinition-distance-pro-pr-katecholamintherapie.html) | MII PR Medikation MedicationAdministration | 62 |
| [DISTANCE:PRO PR Sedierung](StructureDefinition-distance-pro-pr-sedierung.html) | MII PR Medikation MedicationAdministration | 66 |
| [DISTANCE:PRO PR Postoperatives Ereignis](StructureDefinition-distance-pro-pr-postoperatives-ereignis.html) | MII PR Prozedur Procedure | 68–71 |
| [DISTANCE:PRO PR Laboruntersuchung](StructureDefinition-distance-pro-pr-laboruntersuchung.html) | MII PR Labor Laboruntersuchung | 77–106 |
{: .grid}

### Neue Profile

Für diese Items enthält der KDS 2027 kein geeignetes Profil.

| Profil | Basis | CoI-Items |
|---|---|---|
| [DISTANCE:PRO PR BMI](StructureDefinition-distance-pro-pr-bmi.html) | FHIR-Core-Profil *Observation Body Mass Index* | 11 |
| [DISTANCE:PRO PR Gewichtsverlust](StructureDefinition-distance-pro-pr-gewichtsverlust.html) | Observation | 13 |
| [DISTANCE:PRO PR Alter bei Einschluss](StructureDefinition-distance-pro-pr-alter.html) | Observation | 14 |
| [DISTANCE:PRO PR Alkoholkonsum](StructureDefinition-distance-pro-pr-alkoholkonsum.html) | Observation | 21, 22 |
| [DISTANCE:PRO PR Metabolisches Äquivalent](StructureDefinition-distance-pro-pr-met.html) | Observation | 58 |
{: .grid}

### Extension

* [DISTANCE:PRO EX Studienzentrum](StructureDefinition-distance-pro-ex-studienzentrum.html) – Studienzentrum an der Studienteilnahme

### Terminologien

| Artefakt | Inhalt |
|---|---|
| [DISTANCE:PRO CS Beobachtungen](CodeSystem-distance-pro-cs-beobachtungen.html) | Kodes für Hundehaltung und Alkohol-Risikobewertung |
| [DISTANCE:PRO CS Wohnsituation](CodeSystem-distance-pro-cs-wohnsituation.html) | Antwortmöglichkeiten zur Wohnsituation |
| [DISTANCE:PRO VS Lebenssituation](ValueSet-distance-pro-vs-lebenssituation.html) | Antwortmöglichkeiten zur Lebenssituation (SNOMED CT) |
| [DISTANCE:PRO VS Wohnsituation](ValueSet-distance-pro-vs-wohnsituation.html) | Antwortmöglichkeiten zur Wohnsituation |
| [DISTANCE:PRO VS Alkohol Risikobewertung](ValueSet-distance-pro-vs-alkohol-risikobewertung.html) | risikoarm / riskant (SNOMED CT) |
| [DISTANCE:PRO VS Funktionelle Therapien](ValueSet-distance-pro-vs-funktionelle-therapien.html) | Physiotherapie, Ergotherapie, Logopädie (SNOMED CT) |
| [DISTANCE:PRO VS Postoperative Ereignisse](ValueSet-distance-pro-vs-postoperative-ereignisse.html) | Extubation, Intubation, Mobilisation, Kostaufbau (SNOMED CT) |
| [DISTANCE:PRO VS Rehabilitation Setting](ValueSet-distance-pro-vs-rehabilitation-setting.html) | ambulant / stationär |
| [DISTANCE:PRO VS Katecholamine](ValueSet-distance-pro-vs-katecholamine.html) | ATC-Gruppe C01CA |
| [DISTANCE:PRO VS Sedativa](ValueSet-distance-pro-vs-sedativa.html) | ATC-Gruppen N01A und N05C sowie Clonidin |
| [DISTANCE:PRO VS Laborparameter](ValueSet-distance-pro-vs-laborparameter.html) | LOINC-Kodes der Blutgas- und Laborparameter |
{: .grid}

### Logisches Modell

Das [Logical Model des Datensatzes](StructureDefinition-distance-pro-lm-datensatz.html) bildet den Katalog als Datenstruktur ab und trägt die Abbildung auf die FHIR-Profile als formales Mapping.
