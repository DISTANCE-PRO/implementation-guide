Dieser Implementation Guide beschreibt, wie der Datensatz der Studie **DISTANCE:PRO** in HL7 FHIR R4 abgebildet wird. Grundlage ist der *Catalog of Items* (CoI) der Studie in der Version 1.1 vom 08.09.2026 mit 109 Items.

Die Abbildung folgt einem einfachen Grundsatz: Jedes Item wird auf ein bestehendes Profil des [MII Kerndatensatzes](https://medizininformatik-initiative.github.io/kerndatensatz-complete/de/) (KDS) in der Version 2027 abgebildet. Nur wo der KDS kein passendes Profil bereithält, definiert dieser IG ein eigenes – nach Möglichkeit als Ableitung eines KDS-Profils, sodass die Daten weiterhin KDS-konform bleiben.

### Inhalt

* [Mapping](mapping.html) – die vollständige Abbildung aller Items des Katalogs auf Profile, Elemente und Kodierungen
* [Profile und Terminologien](profile.html) – die in diesem IG definierten Profile, Extensions, CodeSysteme und ValueSets
* [Offene Punkte](offene-punkte.html) – Fragen, die vor einer Umsetzung fachlich zu klären sind
* [Artefakte](artifacts.html) – alle FHIR-Artefakte einschließlich Beispielen

### Verwendete Module des MII Kerndatensatzes

Die Versionen entsprechen der Stückliste *MII Kerndatensatz Complete* 2027.0.0-ballot.19. Die 2027er Linie des KDS befindet sich in der Ballotierung; Änderungen an den referenzierten Profilen sind bis zur finalen Veröffentlichung möglich.

| Modul | Package | Version | Verwendung in DISTANCE:PRO |
|---|---|---|---|
| Person, Fall, Diagnose, Prozedur | `de.medizininformatikinitiative.kerndatensatz.base` | 2027.0.0-ballot | Patient, Aufenthalt, Diagnosen, Operationen |
| Medikation | `de.medizininformatikinitiative.kerndatensatz.medikation` | 2027.0.0-ballot | Katecholamine, Sedierung, immunsuppressive Therapie |
| Laborbefund | `de.medizininformatikinitiative.kerndatensatz.laborbefund` | 2027.0.0-ballot | Blutgasanalyse und Laborwerte |
| Studie | `de.medizininformatikinitiative.kerndatensatz.studie` | 2027.0.0-ballot | Studie, Studien-ID, Studienzentrum |
| Consent | `de.medizininformatikinitiative.kerndatensatz.consent` | 2027.0.0-ballot | Einwilligung (Verweis aus der Studienteilnahme) |
| Intensivmedizin (ICU) | `de.medizininformatikinitiative.kerndatensatz.icu` | 2027.0.0-ballot.3 | Vitaldaten, Scores, Beatmung, Bilanzen, Nierenersatz |
| Onkologie | `de.medizininformatikinitiative.kerndatensatz.onkologie` | 2027.0.0-ballot.1 | Tumortherapien, TNM, Grading, Histologie, Karnofsky, ECOG, ASA |
| Pathologie | `de.medizininformatikinitiative.kerndatensatz.patho` | 2027.0.0-ballot | Histologiebefund als Text |
| Patient-Reported Outcomes | `de.medizininformatikinitiative.kerndatensatz.pros` | 2027.0.0-ballot.1 | EORTC QLQ-C30, PHQ-9, GAD-7 |
| Kardiologie | `de.medizininformatikinitiative.kerndatensatz.kardiologie` | 2027.0.0-ballot | Raucherstatus mit Pack Years, NYHA |
| Soziodemographie | `de.medizininformatikinitiative.kerndatensatz.soziodemographie` | 2027.0.0-ballot | Bildung, Beschäftigung, Lebenssituation |
| ISiK | `de.gematik.isik` | 6.0.0 | Ideales Körpergewicht, SpO2 (ICU-Profile, die ab 2027 unter ISiK geführt werden) |
{: .grid}

### Datenschutz

Die Items 1 bis 6 des Katalogs sind identifizierend. Sie sind in diesem IG der Vollständigkeit halber auf das Profil *MII PR Person Patient* abgebildet, gehören aber ausschließlich in den Datenbestand des Studienteams. Für den Forschungsdatensatz ist das Profil *MII PR Person Patient (Pseudonymisiert)* vorgesehen.

### Status

Dieser IG ist ein Entwurf (Version 0.1.0). Der Canonical `https://www.medizininformatik-initiative.de/fhir/distance-pro` ist vorläufig und vor einer Veröffentlichung mit dem Projekt abzustimmen.
