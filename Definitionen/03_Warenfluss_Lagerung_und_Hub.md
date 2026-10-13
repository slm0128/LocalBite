# 03 – Warenfluss, Lagerung & Hub

> Die Kernfrage aus dem Logistikbereich – in allen drei Logistik-BPMN (05/06/07) ausdrücklich als
> **offen** markiert. Betrifft direkt, wo Abholpunkte liegen und wo die Boxen gepackt werden.

## Zentrale Frage

**Wo wird die Ware gelagert – und ob überhaupt?** Gibt es ein zentrales Hub, mehrere Mini-Depots,
oder läuft alles direkt vom Bauern zum Kunden?

## Warum wichtig / was hängt davon ab

- Legt die **Abholorte** in BPMN 05 (Routing) fest.
- Entscheidet, **wo** Wareneingang/Qualitätskontrolle und das **Packen der Box** stattfinden.
- Bestimmt den Bedarf an **Kühlung**, Fläche und Fixkosten.
- Hängt am Geschäftsmodell (Thema 01): Reseller braucht eher Lager, Vermittler eher nicht.

## Optionen / Vorschläge

- **A) Gar keine Lagerung – Cross-Docking / „Just in Time"**
  Ware wird am Liefertag direkt Bauer → Fahrzeug → Kunde durchgereicht, nichts wird gelagert.
  ➕ Maximale Frische, keine Lagerkosten/-risiko. ➖ Erfordert sehr präzise Planung; Box-Packen
  muss unterwegs oder beim Bauern passieren.

- **B) Mini-Umschlagpunkt / Depot** *(kein echtes Lager)*
  Kleiner Standort, an dem Ware mehrerer Höfe **umgeladen, kommissioniert und in Boxen gepackt**
  wird – aber **keine Langzeitlagerung** (Durchlauf am selben Tag).
  ➕ Boxen zentral & sauber packbar, trotzdem frisch. ➖ Ein Standort + etwas Kühlfläche nötig.

- **C) Nur in den Fahrzeugen** *(rollendes Lager)*
  Keine Immobilie; Fahrzeuge sammeln ein und liefern aus. **Aber:** Wo stehen/laden/kühlen die
  Fahrzeuge, wo werden Boxen gepackt? → braucht trotzdem einen Stellplatz/Basis.
  ➕ Sehr schlank. ➖ Begrenzte Menge, Packen schwierig, Kühllogistik heikel.

- **D) Zentrales Hub / Kühllager** *(HelloFresh-Stil)*
  Alle Ware wird zentral angeliefert/eingelagert, Boxen dort gepackt, dann ausgeliefert.
  ➕ Effizient bei Masse, klare QS. ➖ Hohe Fixkosten, längere Wege, geringere „Frische-Story".

- **E) Hybrid – regionale Mini-Hubs** je Landkreis (Kombination aus B und D im Kleinen).

## 💡 Vorschlag

**Option B (Mini-Umschlagpunkt).** Begründung: trifft die Projektleitlinie **„nicht einfach DHL
nachbauen"** und **„Abholung beim Bauern"**, erhält die Frische-Story, braucht aber einen klaren
Ort fürs Packen und die Qualitätskontrolle. Die Logistik-BPMN sind laut Doku bereits **modular** so
gebaut, dass sich diese Wahl einhängen lässt, ohne die Struktur zu ändern.

> Für den Pitch gut: „LocalBite nutzt dezentrale regionale Umschlagpunkte statt eines anonymen
> Großlagers" – das unterstreicht Regionalität.

## ✅ Team-Entscheidung

```
Lagermodell:  ______________________________________________
Wo wird die Box gepackt?:  _________________________________
Kühlung geregelt wo?:      _________________________________
```

## 📌 Betrifft

- BPMN 05 (Abholorte/Routing), BPMN 06 (Ort der Warenprüfung/Beladung), BPMN 10 (Wareneingang & QS)
- UML-Klassen: evtl. `Hub`/`Standort`, `Lagerbestand`
- Thema 04 (Abholung/Lieferung) und 01 (Geschäftsmodell)
