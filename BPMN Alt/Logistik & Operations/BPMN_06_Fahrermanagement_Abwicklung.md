# BPMN 06 – Fahrermanagement & Abwicklung

> **Prozess-ID:** `Process_06V2` · **Stand:** 06.10.2026 · **Bereich:** Logistik & Operations  
> **Rolle:** Ausführung – „BPMN 06 besetzt und fährt die Tour.“  
> **Modell:** BPMN 2.0 Collaboration · 3 Lanes · 45 Modellelemente · 2 externe Pools

## 1. Zweck und Abgrenzung

BPMN 06 übernimmt eine von BPMN 05 geplante und **freigegebene** Tour und führt sie operativ aus.
Der Prozess beginnt mit dem Nachrichten-Startereignis **„Freigegebene Tour erhalten“**.

BPMN 06 entscheidet konkret über: Fahrzeug, Fahrer, Warenübernahme/Beladung, Abwicklung der Stopps,
Umgang mit Störungen und den Tourabschluss. Die Route selbst wird **nicht** neu entworfen – nur wenn
eine Tour lokal nicht mehr ausführbar ist, wird an BPMN 05 zur Neuplanung eskaliert.

### Warum zuerst Fahrzeug, dann Fahrer?

Die technische Touranforderung (z. B. „mindestens 55 Boxen + Kühlung“) bestimmt zuerst, welche
Fahrzeuge überhaupt geeignet sind; erst danach wird ein passender verfügbarer Fahrer zugewiesen.
Darum liegt im Modell die Fahrzeug-Entscheidung (`G06_Veh`) vor der Fahrer-Entscheidung (`G06_Drv`),
jeweils mit eigener Ersatzsuche und gemeinsamer Eskalation auf `T06_Replan`.

### Drei Lanes = drei Verantwortungen

- **Disposition / System** – Ressourcenwahl, Auftrag, Störungsbewertung, Dokumentation
- **Operations / Warenübergabe** – Warenprüfung, Beladung, Übergabe an den Fahrer, Rückgaben
- **Fahrer** – Fahren der Stopp-Schleife (Abholung/Lieferung) und Rückfahrt

## 2. Pools und Lanes

| Pool / Lane | Rolle |
|---|---|
| **Pool: 06 – Fahrermanagement & Abwicklung** | eigener Prozess (dieses Modell) |
| &nbsp;&nbsp;↳ Lane: Disposition / System | Verantwortungsbereich |
| &nbsp;&nbsp;↳ Lane: Operations / Warenübergabe | Verantwortungsbereich |
| &nbsp;&nbsp;↳ Lane: Fahrer | Verantwortungsbereich |
| Externer Pool: 05 – Auslieferung & Routing | Partner (nur über Nachrichten) |
| Externer Pool: 07 – Retouren & Pfand-Management | Partner (nur über Nachrichten) |

## 3. Elemente je Lane

Die folgende Übersicht ist direkt aus dem BPMN-Modell erzeugt und daher deckungsgleich mit der Grafik.

### Lane: Disposition / System

| ID | Typ | Bezeichnung |
|---|---|---|
| `S06` | Startereignis | Freigegebene Tour erhalten (Nachricht) |
| `T06_Req` | Aufgabe | Touranforderungen prüfen |
| `T06_Vehicle` | Aufgabe | Konkretes geeignetes Fahrzeug auswählen |
| `G06_Veh` | XOR-Gateway (Entscheidung) | Fahrzeug verfügbar? |
| `T06_VehReplace` | User-Task | Ersatzfahrzeug suchen |
| `G06_VehRep` | XOR-Gateway (Entscheidung) | Ersatz gefunden? |
| `T06_Driver` | Aufgabe | Konkreten geeigneten Fahrer auswählen |
| `G06_Drv` | XOR-Gateway (Entscheidung) | Fahrer verfügbar? |
| `T06_DrvReplace` | User-Task | Ersatzfahrer suchen |
| `G06_DrvRep` | XOR-Gateway (Entscheidung) | Ersatz gefunden? |
| `T06_Assign` | Aufgabe | Fahrzeug und Fahrer verbindlich zuweisen |
| `T06_Replan` | Aufgabe | Neuplanung / Verschiebung an BPMN 05 melden |
| `E06_ReplanEnd` | Endereignis | Neuplanung angefordert |
| `T06_Order` | Aufgabe | Tourauftrag und Übergabeinformationen bereitstellen |
| `T06_ProbEval` | User-Task | Problem bewerten und lokalen Fallback prüfen |
| `G06_Mach` | XOR-Gateway (Entscheidung) | Tour weiterhin machbar? |
| `T06_Fallback` | User-Task | Operativen Fallback koordinieren (z. B. Ersatz oder Fahrzeug-zu-Fahrzeug-Transfer) |
| `G06_Continue` | XOR-Gateway (Entscheidung) | Fortsetzung möglich? |
| `T06_Abort` | Aufgabe | Tourabbruch / Neuplanung an BPMN 05 melden |
| `T06_VehStatus` | Aufgabe | Fahrzeugstatus melden |
| `T06_Doc` | Aufgabe | Tourergebnis dokumentieren |
| `E06_End` | Endereignis | Tour abgeschlossen |

### Lane: Operations / Warenübergabe

| ID | Typ | Bezeichnung |
|---|---|---|
| `T06_Prepare` | Manuelle Aufgabe | Warenübernahme vorbereiten |
| `T06_CheckGoods` | User-Task | Ware bei Übernahme auf Menge, Zustand, Verpackung und Temperatur prüfen |
| `G06_Goods` | XOR-Gateway (Entscheidung) | Ware transportfähig? |
| `T06_LocalFix` | User-Task | Problem lokal klären |
| `G06_Local` | XOR-Gateway (Entscheidung) | Lokal lösbar? |
| `T06_GoodsReplan` | Aufgabe | Teil-Neuplanung an Disposition / BPMN 05 melden |
| `T06_Load` | Manuelle Aufgabe | Fahrzeug beladen |
| `T06_Secure` | User-Task | Beladung, Temperatur und Sicherung kontrollieren |
| `T06_Handover` | User-Task | Fahrzeug und Tour an Fahrer übergeben |
| `T06_Returns` | Manuelle Aufgabe | Restware, Pfandboxen und Retouren übergeben |

### Lane: Fahrer

| ID | Typ | Bezeichnung |
|---|---|---|
| `T06_Take` | User-Task | Fahrer übernimmt Fahrzeug und Tour |
| `T06_Start` | User-Task | Tour starten / Status unterwegs setzen |
| `T06_Next` | User-Task | Nächsten geplanten Stopp anfahren |
| `G06_Stop` | XOR-Gateway (Entscheidung) | Stoppart? |
| `T06_Pick` | Manuelle Aufgabe | Ware am Abholort übernehmen |
| `T06_PickConf` | User-Task | Menge und Zustand bestätigen |
| `T06_Deliver` | Manuelle Aufgabe | Bestellung zustellen / vorgemerkte Pfandbox mitnehmen |
| `T06_DelConf` | User-Task | Zustellung / Rückgabe bestätigen |
| `G06_StopMerge` | XOR-Gateway (Entscheidung) | Stopp abgeschlossen |
| `T06_Status` | Aufgabe | Tour- und Lieferstatus aktualisieren |
| `G06_Prob` | XOR-Gateway (Entscheidung) | Problem aufgetreten? |
| `G06_More` | XOR-Gateway (Entscheidung) | Weitere Stopps? |
| `T06_Return` | User-Task | Rückfahrt / Übergabe am LocalBite-Standort |

## 4. Entscheidungen und Verzweigungen

Alle Gateways sind als geschlossene Fragen formuliert; beschriftete Kanten:

| Entscheidung / Verzweigung | Kante | Folgeschritt |
|---|---|---|
| Fahrzeug verfügbar? | **Ja** | Konkreten geeigneten Fahrer auswählen |
|  | **Nein** | Ersatzfahrzeug suchen |
| Ersatz gefunden? | **Ja** | Konkreten geeigneten Fahrer auswählen |
|  | **Nein** | Neuplanung / Verschiebung an BPMN 05 melden |
|  | **Ja** | Fahrzeug und Fahrer verbindlich zuweisen |
|  | **Nein** | Neuplanung / Verschiebung an BPMN 05 melden |
| Fahrer verfügbar? | **Ja** | Fahrzeug und Fahrer verbindlich zuweisen |
|  | **Nein** | Ersatzfahrer suchen |
| Ware transportfähig? | **Ja** | Fahrzeug beladen |
|  | **Nein** | Problem lokal klären |
| Lokal lösbar? | **Ja** | Fahrzeug beladen |
|  | **Nein** | Teil-Neuplanung an Disposition / BPMN 05 melden |
| Stoppart? | **Abholung** | Ware am Abholort übernehmen |
|  | **Lieferung** | Bestellung zustellen / vorgemerkte Pfandbox mitnehmen |
| Problem aufgetreten? | **Nein** | Weitere Stopps? |
|  | **Ja** | Problem bewerten und lokalen Fallback prüfen |
| Tour weiterhin machbar? | **Ja** | Weitere Stopps? |
|  | **Nein** | Operativen Fallback koordinieren (z. B. Ersatz oder Fahrzeug-zu-Fahrzeug-Transfer) |
| Fortsetzung möglich? | **Ja** | Weitere Stopps? |
|  | **Nein** | Tourabbruch / Neuplanung an BPMN 05 melden |
| Weitere Stopps? | **Ja** | Nächsten geplanten Stopp anfahren |
|  | **Nein** | Rückfahrt / Übergabe am LocalBite-Standort |

## 5. Nachrichtenflüsse (Schnittstellen)

| Von | Nachricht | An |
|---|---|---|
| 05 – Auslieferung & Routing | Freigegebene Tour | Freigegebene Tour erhalten |
| Neuplanung / Verschiebung an BPMN 05 melden | Neuplanung erforderlich | 05 – Auslieferung & Routing |
| Restware, Pfandboxen und Retouren übergeben | Pfandboxen / Retouren | 07 – Retouren & Pfand-Management |

**Eingang (05 → 06):** Nachricht „Freigegebene Tour“ mit Abholorten, Lieferzielen, Reihenfolge,
Kapazität, Ausstattung (z. B. Kühlung), erwarteter Dauer und Zeitfenstern.

**Rücksprung (06 → 05):** `T06_Replan` meldet „Neuplanung erforderlich“, wenn weder Fahrzeug noch
Fahrer besetzbar sind, die Warenprüfung nicht lösbar ist oder eine Tour unterwegs abgebrochen wird.

**Ausgang (06 → 07):** Am Tourende übergibt `T06_Returns` physisch mitgenommene Pfandboxen /
Retouren an BPMN 07; die eigentliche Pfand-, Zustands- und Wiederverwendungslogik liegt dort.

## 6. Daten und Modell-Anmerkungen

- Fahrzeug-zu-Fahrzeug-Transfer ist nur ein Ausnahme-Fallback, z. B. bei Ausfall, Überlastung oder starker Verspätung. Hub vs. direkte Abholung bleibt offen.

## 7. Offene Punkte

- genaue Regeln für den Fahrzeug-zu-Fahrzeug-Transfer (nur Ausnahme-Fallback)
- Ort der Warenprüfung abhängig von „Hub vs. direkte Abholung“ (Modell bleibt dafür modular)
- konkrete Fahrzeugklassen / Kapazitäten / Kühl- und Spezialausstattung

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
