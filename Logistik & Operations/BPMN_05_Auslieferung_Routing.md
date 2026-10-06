# BPMN 05 – Auslieferung & Routing

> **Prozess-ID:** `Process_05V2` · **Stand:** 06.10.2026 · **Bereich:** Logistik & Operations  
> **Rolle:** Planung – „BPMN 05 baut die Tour.“  
> **Modell:** BPMN 2.0 Collaboration · 2 Lanes · 24 Modellelemente · 2 externe Pools

## 1. Zweck und Abgrenzung

BPMN 05 plant für ein Lieferdatum `D` die konkreten Touren. Der Prozess legt fest,
**welche Kunden und Abholorte zusammengehören, in welcher Reihenfolge sie bedient werden und
welche technischen Anforderungen eine Tour hat.**

**Nicht** Aufgabe von BPMN 05 (gehört zu BPMN 06):

- ein konkretes Fahrzeug auswählen
- einen konkreten Fahrer auswählen
- Ware tatsächlich laden oder die Tour fahren

Der detaillierte Bestandsabgleich mit den Bauern ist vorgelagert (Bereich *Landwirte & Lieferanten*);
BPMN 05 übernimmt dessen Ergebnis als Nachricht **„Bedarf + Waren geklärt“**.

### Planungsmodell T-2 / T-1 / T-0

Eine Prozessinstanz behandelt **genau ein Lieferdatum `D`**; für mehrere Liefertage laufen
mehrere Instanzen parallel. Die beiden Timer-Zwischenereignisse `E05_T1` und `E05_T0` takten die
drei Planungsstufen:

| Stufe | Zeitpunkt | Inhalt | Verbindlich? |
|---|---|---|---|
| T-2 | Vorplanung | Forecast/Abos, Liefergebiete und groben Transportbedarf abschätzen | nein |
| T-1 | Hauptplanung | Abhol-/Lieferpunkte, Transportanforderungen, Tourbündelung und -optimierung | ja (vorläufig) |
| T-0 | Finaler Check | späte Änderungen gezielt nachplanen, Touren verbindlich freigeben | ja (final) |

## 2. Pools und Lanes

| Pool / Lane | Rolle |
|---|---|
| **Pool: 05 – Auslieferung & Routing** | eigener Prozess (dieses Modell) |
| &nbsp;&nbsp;↳ Lane: System / Routing | Verantwortungsbereich |
| &nbsp;&nbsp;↳ Lane: Disposition / Logistikplanung | Verantwortungsbereich |
| Externer Pool: Bedarfs- / Bestandsabgleich | Partner (nur über Nachrichten) |
| Externer Pool: 06 – Fahrermanagement & Abwicklung | Partner (nur über Nachrichten) |

## 3. Elemente je Lane

Die folgende Übersicht ist direkt aus dem BPMN-Modell erzeugt und daher deckungsgleich mit der Grafik.

### Lane: System / Routing

| ID | Typ | Bezeichnung |
|---|---|---|
| `S05` | Startereignis | T-2 Planungszeitpunkt erreicht |
| `T05_Forecast` | Aufgabe | Forecast und bekannte Bestellungen auswerten |
| `T05_Grob` | Aufgabe | Liefergebiete und groben Transportbedarf prognostizieren |
| `E05_T1` | Zwischenereignis (eingehend) | T-1 erreicht (Timer P1D) |
| `T05_Input` | Aufgabe | Verbindliche Bedarfs- und Warenfreigabe übernehmen |
| `T05_Points` | Aufgabe | Abholorte und Lieferziele festlegen |
| `T05_Req` | Aufgabe | Transportanforderungen je Bestellung bestimmen |
| `T05_Group` | Aufgabe | Kunden vorläufig zu Touren bündeln |
| `G05_Doable` | XOR-Gateway (Entscheidung) | Tourgruppe grundsätzlich machbar? |
| `T05_TourReq` | Aufgabe | Touranforderungen bestimmen |
| `T05_PickPts` | Aufgabe | Benötigte Abholorte je Tour bestimmen |
| `T05_PickRoute` | Aufgabe | Abholreihenfolge berechnen |
| `T05_DelRoute` | Aufgabe | Lieferreihenfolge berechnen |
| `T05_Check` | Aufgabe | Gesamttour gegen Kapazität, Ausstattung, Zeitfenster und Dauer prüfen |
| `G05_Good` | XOR-Gateway (Entscheidung) | Tour sinnvoll? |
| `T05_Save` | Aufgabe | Tour vorläufig speichern |
| `E05_T0` | Zwischenereignis (eingehend) | T-0 erreicht (Timer P1D) |
| `T05_Final` | Aufgabe | Finalen Änderungscheck durchführen |
| `G05_Change` | XOR-Gateway (Entscheidung) | Anpassung nötig? |

### Lane: Disposition / Logistikplanung

| ID | Typ | Bezeichnung |
|---|---|---|
| `T05_Regroup` | User-Task | Kundengruppe teilen / neu zusammenstellen |
| `T05_Optimize` | User-Task | Tour optimieren / Kundengruppe anpassen |
| `T05_Replan` | User-Task | Betroffene Tour gezielt nachplanen |
| `T05_Release` | User-Task | Tour verbindlich freigeben |
| `E05_End` | Endereignis | Tour geplant und freigegeben |

## 4. Entscheidungen und Verzweigungen

Alle Gateways sind als geschlossene Fragen formuliert; beschriftete Kanten:

| Entscheidung / Verzweigung | Kante | Folgeschritt |
|---|---|---|
| Tourgruppe grundsätzlich machbar? | **Ja** | Touranforderungen bestimmen |
|  | **Nein** | Kundengruppe teilen / neu zusammenstellen |
| Tour sinnvoll? | **Ja** | Tour vorläufig speichern |
|  | **Nein** | Tour optimieren / Kundengruppe anpassen |
| Anpassung nötig? | **Nein** | Tour verbindlich freigeben |
|  | **Ja** | Betroffene Tour gezielt nachplanen |
| Kundengruppe teilen / neu zusammenstellen | **Neu bündeln** | Kunden vorläufig zu Touren bündeln |
| Tour optimieren / Kundengruppe anpassen | **Neu optimieren** | Kunden vorläufig zu Touren bündeln |
| Betroffene Tour gezielt nachplanen | **Gezielt nachplanen** | Gesamttour gegen Kapazität, Ausstattung, Zeitfenster und Dauer prüfen |

## 5. Nachrichtenflüsse (Schnittstellen)

| Von | Nachricht | An |
|---|---|---|
| Bedarfs- / Bestandsabgleich | Bedarf + Waren geklärt | Verbindliche Bedarfs- und Warenfreigabe übernehmen |
| Tour verbindlich freigeben | Freigegebene Tour | 06 – Fahrermanagement & Abwicklung |

BPMN 05 liefert als Ergebnis eine **geplante und freigegebene Tour** und sendet sie per
Nachricht an BPMN 06. Übergeben werden: Abholorte, Lieferziele, geplante Reihenfolge,
Kapazitätsbedarf, Kühl-/Ausstattungsanforderungen, erwartete Dauer und Kundenzeitfenster.
Das konkrete Fahrzeug und der konkrete Fahrer werden **erst in BPMN 06** gewählt.

```text
Beispiel – Tour 3 „Karlsruhe West“
Abholung:  Bauer A → Milchhof C → Bäckerei D
Lieferung: Kunde 14 → 22 → 31 → 44 → …
Anforderung: ≥ 55 Boxen · Kühlung · ca. 5 h · definierte Zeitfenster
```

## 6. Daten und Modell-Anmerkungen

- Offen: Hub vs. direkte Abholung, konkrete Cutoff-Zeiten und finale Fahrzeugklassen. Diese Details ändern die Grundstruktur nicht.

## 7. Offene Punkte

- Hub vs. direkte Abholung beim Bauern vs. Hybridmodell (ändert nur Abholpunkte, nicht die Struktur)
- exakte Cutoff-Zeiten für T-2 / T-1 / T-0 und für späte Bestellungen
- wie weit eine freigegebene Tour nach T-1/T-0 noch verändert werden darf
- konkrete Fahrzeugklassen, Kapazitäten und Kühlanforderungen (fließen als Touranforderung ein)

## Anhang A – BPMN-Notation (Legende)

| Symbol | Bedeutung | Verwendung in diesem Modell |
|---|---|---|
| Kreis (dünn) | Start-/Zwischenereignis | Auslöser, Timer (T-1/T-0, Tag 30), eingehende Nachrichten |
| Kreis (dick) | Endereignis | definierter Prozessabschluss |
| abgerundetes Rechteck | Aufgabe (Task) | ein Arbeitsschritt; `User-Task` = Mensch, `Manuelle Aufgabe` = physisch, `Aufgabe` = System/automatisiert |
| Raute mit X | XOR-Gateway | **Entscheidung** – genau ein Ausgang |
| Raute mit + | AND-Gateway | **Parallelität** – alle Ausgänge gleichzeitig |
| Raute mit Pentagon | Ereignisbasiertes Gateway | Warten auf das zuerst eintretende Ereignis |
| durchgezogener Pfeil | Sequenzfluss | Reihenfolge innerhalb eines Pools |
| gestrichelter Pfeil | Nachrichtenfluss | Kommunikation **zwischen** Pools |
| gestrichelte Linie (ohne Pfeil) | Assoziation | verbindet Datenobjekt / Kommentar mit einem Schritt |

### Visueller Standard (für alle drei Modelle einheitlich)

- Hauptfluss strikt links → rechts, keine Rücksprünge im Hauptpfad
- einheitliche Task-Größe (160 × 76), einheitliches Spaltenraster
- Verzweigungen werden innerhalb ihrer Lane unter dem Hauptfluss gestapelt
- Rücksprünge / Schleifen laufen als eigene Kanäle sauber **unterhalb** des Pools
- Nachrichtenflüsse ausschließlich zwischen Pools, nie innerhalb einer Lane
- einheitliche Gateway-Beschriftung als geschlossene Frage mit `Ja` / `Nein`-Kanten
