# BPMN 07 – Retouren & Pfand-Management

> **Prozess-ID:** `Process_07V2` · **Stand:** 06.10.2026 · **Bereich:** Logistik & Operations  
> **Rolle:** Rückabwicklung – „BPMN 07 wickelt Rückgabe, Pfand und Boxzustand ab.“  
> **Modell:** BPMN 2.0 Collaboration · 2 Lanes · 40 Modellelemente · 2 externe Pools

## 1. Zweck und Abgrenzung

BPMN 07 behandelt die vollständige **Rückgabe- und Pfandabwicklung** der LocalBite-Mehrwegboxen.
Es gibt zwei Rückgabewege, die im Modell über das XOR-Gateway `G07_Next` getrennt werden:

1. **Rückgabe bei einer nächsten Lieferung** (über BPMN 06)
2. **Rückgabe an einem zentralen LocalBite-Rückgabeort** – mit ereignisbasiertem Warten
   (`G07_Wait`) auf *Rückgabe* **oder** *Tag 30 erreicht*.

Nach erfolgter Rückgabe werden **Pfand** und **Boxzustand** über ein AND-Gateway (`G07_Split` /
`G07_Join`) **parallel** bearbeitet und anschließend wieder zusammengeführt.

### Boxkonzept

Favorisiert ist eine stabile, lebensmittelechte **Mehrwegbox aus hochwertigem Recycling-Kunststoff**
(waschbar, stapelbar, langlebig, recyclingfähig, eindeutig identifizierbar). Jede Box trägt eine
eindeutige ID (z. B. `LB-004281`) für QR/Barcode/RFID, sodass eine **Boxhistorie** geführt werden
kann und Altschäden nicht fälschlich dem aktuellen Kunden zugeordnet werden.

### Pfandregel (Rückgabefrist)

| Rückgabezeit | Pfanderstattung |
|---|---:|
| Tag 0–14 | 100 % |
| Tag 15–21 | 75 % |
| Tag 22–29 | 50 % |
| ab Tag 30 | 0 % |

Ab Tag 30 wird die Box weiter zurückgenommen und ggf. wiederverwendet – nur der Pfandanspruch entfällt.

### Pfand und Schaden sind getrennt

- normale Gebrauchsspuren → LocalBite trägt den Verschleiß
- bereits bekannter Vorschaden → aktueller Kunde haftet nicht
- neuer erheblicher Schaden → separater Schadensfall (`T07_DamageDoc` → `G07_Cause`)
- unklare Ursache → manuelle Prüfung (`T07_Manual`)
- es gibt **keine** Automatik „Box beschädigt = Kunde zahlt“

## 2. Pools und Lanes

| Pool / Lane | Rolle |
|---|---|
| **Pool: 07 – Retouren & Pfand-Management** | eigener Prozess (dieses Modell) |
| &nbsp;&nbsp;↳ Lane: System / Pfandverwaltung | Verantwortungsbereich |
| &nbsp;&nbsp;↳ Lane: Rücknahme / Qualitätsprüfung | Verantwortungsbereich |
| Externer Pool: 06 – Fahrermanagement & Abwicklung | Partner (nur über Nachrichten) |
| Externer Pool: Kunde | Partner (nur über Nachrichten) |

## 3. Elemente je Lane

Die folgende Übersicht ist direkt aus dem BPMN-Modell erzeugt und daher deckungsgleich mit der Grafik.

### Lane: System / Pfandverwaltung

| ID | Typ | Bezeichnung |
|---|---|---|
| `S07` | Startereignis | Rückgabefall angelegt |
| `T07_Assign` | Aufgabe | Box-ID Kunde und Bestellung zuordnen |
| `T07_Monitor` | Aufgabe | Rückgabefrist überwachen |
| `G07_Next` | XOR-Gateway (Entscheidung) | Nächste Lieferung rechtzeitig? |
| `T07_Sched` | Aufgabe | Rückgabe bei nächster Lieferung vormerken |
| `T07_Notify06` | Aufgabe | BPMN 06 über Rücknahme informieren |
| `T07_Result06` | Aufgabe | Rückgabeergebnis übernehmen |
| `G07_Returned` | XOR-Gateway (Entscheidung) | Box zurückgegeben? |
| `T07_Further` | Aufgabe | Weitere rechtzeitige Lieferung prüfen |
| `G07_Further` | XOR-Gateway (Entscheidung) | Weitere Lieferung möglich? |
| `T07_CentralInfo` | Aufgabe | Zentralen LocalBite-Rückgabeort mitteilen |
| `G07_Wait` | Ereignisbasiertes Gateway | Auf Rückgabe oder Tag 30 warten |
| `E07_Return` | Zwischenereignis (eingehend) | Box zentral zurückgegeben (Nachricht) |
| `E07_Day30` | Zwischenereignis (eingehend) | Tag 30 erreicht (Timer P16D) |
| `T07_Retain` | Aufgabe | Pfand vollständig einbehalten |
| `E07_Late` | Zwischenereignis (eingehend) | Späte Rückgabe erhalten (Nachricht) |
| `G07_MergeReturn` | XOR-Gateway (Entscheidung) | Rückgabe erfolgt |
| `T07_History` | Aufgabe | Box-Historie und Vorschäden laden |
| `G07_Split` | AND-Gateway (Parallel) | Pfand und Zustand parallel bearbeiten |
| `T07_Duration` | Aufgabe | Rückgabedauer berechnen |
| `T07_DepositRule` | Aufgabe | Pfandanspruch nach Fristregel bestimmen |
| `T07_DepositBook` | Aufgabe | Pfand erstatten / einbehalten und verbuchen |
| `G07_Join` | AND-Gateway (Parallel) | Pfand und Boxbehandlung abgeschlossen |
| `T07_Stock` | Aufgabe | Boxbestand / Boxstatus aktualisieren |
| `E07_End` | Endereignis | Rückgabefall abgeschlossen |

### Lane: Rücknahme / Qualitätsprüfung

| ID | Typ | Bezeichnung |
|---|---|---|
| `T07_Scan` | Manuelle Aufgabe | Box-ID scannen / Rückgabe registrieren |
| `T07_State` | User-Task | Boxzustand dokumentieren |
| `T07_Compare` | Aufgabe | Zustand mit Box-Historie vergleichen |
| `G07_Damage` | XOR-Gateway (Entscheidung) | Neuer erheblicher Schaden? |
| `T07_DamageDoc` | User-Task | Schaden dokumentieren |
| `G07_Cause` | XOR-Gateway (Entscheidung) | Verursachung eindeutig? |
| `T07_CustDamage` | User-Task | Möglichen Kundenschadensfall prüfen |
| `T07_Manual` | User-Task | Manuelle Schadensklärung |
| `G07_DmgMerge` | XOR-Gateway (Entscheidung) | Schaden geklärt |
| `T07_Reuse` | User-Task | Wiederverwendbarkeit bestimmen |
| `G07_Treat` | XOR-Gateway (Entscheidung) | Behandlung der Box |
| `T07_Clean` | Manuelle Aufgabe | Box reinigen |
| `T07_Repair` | Manuelle Aufgabe | Box reparieren und anschließend reinigen |
| `T07_Recycle` | Manuelle Aufgabe | Box aussortieren / Recycling |
| `G07_TreatMerge` | XOR-Gateway (Entscheidung) | Boxbehandlung abgeschlossen |

## 4. Entscheidungen und Verzweigungen

Alle Gateways sind als geschlossene Fragen formuliert; beschriftete Kanten:

| Entscheidung / Verzweigung | Kante | Folgeschritt |
|---|---|---|
| Nächste Lieferung rechtzeitig? | **Ja** | Rückgabe bei nächster Lieferung vormerken |
|  | **Nein** | Zentralen LocalBite-Rückgabeort mitteilen |
| Box zurückgegeben? | **Ja** | Rückgabe erfolgt |
|  | **Nein** | Weitere rechtzeitige Lieferung prüfen |
| Weitere Lieferung möglich? | **Ja** | Rückgabe bei nächster Lieferung vormerken |
|  | **Nein** | Zentralen LocalBite-Rückgabeort mitteilen |
| Auf Rückgabe oder Tag 30 warten | **Rückgabe** | Box zentral zurückgegeben |
|  | **Tag 30** | Tag 30 erreicht |
| Pfand und Zustand parallel bearbeiten | **Pfand** | Rückgabedauer berechnen |
|  | **Zustand** | Zustand mit Box-Historie vergleichen |
| Neuer erheblicher Schaden? | **Nein / Vorschaden / normale Abnutzung** | Wiederverwendbarkeit bestimmen |
|  | **Ja** | Schaden dokumentieren |
| Verursachung eindeutig? | **Ja** | Möglichen Kundenschadensfall prüfen |
|  | **Nein** | Manuelle Schadensklärung |
| Behandlung der Box | **Direkt wiederverwendbar** | Box reinigen |
|  | **Reparierbar** | Box reparieren und anschließend reinigen |
|  | **Nicht wiederverwendbar** | Box aussortieren / Recycling |

## 5. Nachrichtenflüsse (Schnittstellen)

| Von | Nachricht | An |
|---|---|---|
| BPMN 06 über Rücknahme informieren | Rücknahmehinweis | 06 – Fahrermanagement & Abwicklung |
| 06 – Fahrermanagement & Abwicklung | Rückgabeergebnis | Rückgabeergebnis übernehmen |
| Zentralen LocalBite-Rückgabeort mitteilen | Rückgabeort / Frist | Kunde |
| Kunde | Box zurückgegeben | Box zentral zurückgegeben |
| Kunde | Späte Rückgabe | Späte Rückgabe erhalten |

**Eingang (06 → 07):** Bei einer Lieferung kann BPMN 06 eine alte Box physisch mitnehmen; der
Rückgabefall wird in BPMN 07 angelegt. Für den Weg „nächste Lieferung“ stimmt sich BPMN 07 über
Nachrichten mit BPMN 06 ab (`Rücknahmehinweis` / `Rückgabeergebnis`).

**Kunde:** Für die zentrale Rückgabe kommuniziert BPMN 07 direkt mit dem Pool *Kunde*
(Rückgabeort/Frist hin, Box-Rückgabe zurück).

Für jede Box werden mindestens Box-ID, Ausgabe-/Rückgabezeitpunkt, Kunde/Bestellung, Zustand bei
Ausgabe und Rückgabe, bekannte Vorschäden, Pfandstatus, Wiederverwendbarkeit und Reparatur-/
Aussortierungsstatus gespeichert (Datenspeicher `Box-Historie`).

## 6. Daten und Modell-Anmerkungen

- Pfandregel: Tag 0–14 = 100 %, Tag 15–21 = 75 %, Tag 22–29 = 50 %, ab Tag 30 = 0 %. Pfand und Schadensersatz werden getrennt behandelt.
- TODO: zentralen Rückgabeort, absolute Pfandhöhe, Boxgrößen sowie konkrete Scan-/RFID-/Kameratechnik final festlegen. Material: langlebige lebensmittelechte Mehrwegbox aus Recycling-Kunststoff.

## 7. Offene Punkte

- konkrete Pfandhöhe (absoluter Betrag) und Boxgrößen / Boxklassen
- genauer zentraler LocalBite-Rückgabeort
- finale Scan-/Kamera-/RFID-Technik für die Box-ID-Erfassung
- Schwelle zwischen normaler Abnutzung und erheblichem/neuem Schaden sowie die Einspruchsregel

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
