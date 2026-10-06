# DISTANCE:PRO Implementation Guide

FHIR-Implementation-Guide für den Datensatz der Studie DISTANCE:PRO auf Basis des
[MII Kerndatensatzes 2027](https://github.com/medizininformatik-initiative/kerndatensatz-complete).
Die Items des *Catalog of Items* (`COI_DISTANCE_PRO_2026-09-08_v1.1.xlsx`, nicht Teil des Repositories) werden auf
bestehende KDS-Profile abgebildet; nur wo keines passt, definiert der IG eigene Profile.

## Aufbau

| Pfad | Inhalt |
|---|---|
| `sushi-config.yaml`, `ig.ini` | Konfiguration für SUSHI und den IG Publisher |
| `mapping/distance-pro-mapping.csv` | **Quelle der Abbildung** Item → Profil, Element, Kodierung |
| `scripts/build_mapping.py` | erzeugt daraus die Mapping-Seite, das Logical Model und das Labor-ValueSet |
| `input/fsh/` | Profile, Extensions, Terminologien und Beispiele in FHIR Shorthand |
| `input/pagecontent/` | Seiten des IG |

Dateien mit dem Präfix `generated-` sowie `input/pagecontent/mapping.md` werden erzeugt
und nicht von Hand bearbeitet.

## Bauen

Voraussetzungen: Node.js mit [SUSHI](https://fshschool.org/docs/sushi/installation/), Java 17+,
Jekyll (für den IG Publisher) und Python 3.

```bash
python3 scripts/build_mapping.py   # nach Änderungen an der Mapping-CSV
sushi build .                      # nur FSH prüfen und übersetzen
./_updatePublisher.sh              # IG Publisher einmalig laden
./_genonce.sh                      # IG bauen, Ergebnis in output/
```

Ohne lokale Java-/Jekyll-Installation lässt sich der IG im Publisher-Container bauen:

```bash
docker run --rm -v "$PWD":/home/publisher/ig -v "$HOME/.fhir":/home/publisher/.fhir \
  hl7fhir/ig-publisher-base:latest ./_genonce.sh
```

## CI und Veröffentlichung

`.github/workflows/ig-publisher.yml` baut den IG bei jedem Push mit SUSHI und dem IG Publisher
und schreibt das Ergebnis in den Branch `gh-pages`:

* `main` → `https://distance-pro.github.io/implementation-guide/`
* andere Branches → `https://distance-pro.github.io/implementation-guide/branches/<branch>/`

Einmalige Einrichtung im Repository: *Settings → Pages → Deploy from a branch → `gh-pages` / (root)*.
Der QA-Bericht des Publishers liegt jeweils unter `qa.html`.
