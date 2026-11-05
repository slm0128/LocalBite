# Tierpartnerschaft eingehen und verwalten

## Fundstellen und fachlicher Stand

- Das Brainstorming beschreibt die Grundidee: Ein Kunde unterstützt bzw. sponsert ein Tier und erhält dafür einen Hofrabatt.
- Die aktuelle Definitionssammlung benennt die Tierpartnerschaft als wichtigen Teil des Geschäftsmodells, lässt aber ausdrücklich offen, was finanziert wird, welche Gegenleistungen verbindlich gelten und ob es sich um eine echte Beteiligung oder ein Kundenbindungsmodell handelt.
- Der Website-Prototyp `Praesentation/Website App/V5.html` konkretisiert einen möglichen Ablauf: monatliche Anteile, auswählbare Laufzeiten, Rabatt, Weide-Updates und eine Nachricht bzw. ein Besuchswunsch an den Hof. Der Landwirt kann ein Tierprofil mit Beitrag, Rabatt, maximalen Anteilen, Beschreibung und Foto veröffentlichen.
- Die im Prototyp gezeigten Beträge und Rabatte sind Beispiele bzw. Eingabewerte des Mockups, keine bestätigten Geschäftsregeln. Der Prototyp zeigt außerdem keine tatsächliche Abbuchung.

## Ablaufskizze

1. **Landwirt stellt ein Angebot ein:** Tierprofil mit Tiername, Tierart/Rasse, monatlichem Beitrag, Rabatt, verfügbarer Anteilszahl, Beschreibung und optionalem Foto anlegen und veröffentlichen. Laufende Weide-Updates können das Profil ergänzen.
2. **Kunde entdeckt ein Tier:** Angebote und Details ansehen, etwa Hof, Beitrag pro Anteil, Rabatt, verfügbare Anteile und aktuelles Weide-Update.
3. **Kunde konfiguriert die Partnerschaft:** Anzahl der Anteile und Laufzeit auswählen sowie optional eine Nachricht oder einen Besuchswunsch an den Hof formulieren.
4. **Kunde sendet eine Anfrage:** Die Plattform speichert die Anfrage zunächst als offen. Es entsteht noch keine aktive Partnerschaft; Anteile werden nicht belegt und ein Rabatt wird nicht gewährt.
5. **Landwirt entscheidet:** Bei Annahme trägt die Plattform die Partnerschaft als aktiv in die Datenbank ein und aktiviert den Rabatt. Dieser aktive Datenbankeintrag löst die Abbuchung aus. Bei Ablehnung wird die Anfrage als abgelehnt gespeichert; es entsteht keine aktive Partnerschaft und es gibt weder Abbuchung noch Rabatt oder belegte Anteile.
6. **Laufende Verwaltung:** Profil und Weide-Updates werden vom Landwirt gepflegt; der Kunde kann aktive Partnerschaften wiederfinden und den Rabatt bei Wochenbox-Bestellungen nutzen. Abbuchung und Kündigung werden in separaten Diagrammen behandelt.

## Sequenzdiagramm

```mermaid
sequenceDiagram
    autonumber
    actor Kunde
    participant Plattform as LocalBite-Plattform
    database DB as Datenbank
    actor Landwirt

    Landwirt->>Plattform: Tierprofil mit Beitrag, Rabatt, Anteilen und Beschreibung anlegen
    opt Foto oder Weide-Update ergänzen
        Landwirt->>Plattform: Foto oder aktuelles Update veröffentlichen
    end
    Plattform->>DB: Angebot speichern und veröffentlichen
    DB-->>Plattform: Angebot gespeichert

    Kunde->>Plattform: Tier-Partnerschaften aufrufen
    Plattform->>DB: Verfügbare Tierprofile und Belegung laden
    DB-->>Plattform: Profile, Preise, Rabatte, freie Anteile und Updates
    Plattform-->>Kunde: Angebote und Details anzeigen

    Kunde->>Plattform: Tier auswählen
    Plattform-->>Kunde: Buchungsvereinbarung mit Beitrag und Rabatt anzeigen
    Kunde->>Plattform: Anteile, Laufzeit und optionale Nachricht auswählen
    Kunde->>Plattform: Partnerschaft verbindlich anfragen
    Plattform->>DB: Anfrage mit Status „Offen“ speichern
    DB-->>Plattform: Anfrage gespeichert
    Plattform-->>Kunde: Anfrage zur Entscheidung an den Landwirt übermitteln

    Landwirt->>Plattform: Offene Anfrage im Hof-Postfach ansehen
    alt Landwirt nimmt Anfrage an
        Landwirt->>Plattform: Anfrage annehmen und optional antworten
        Plattform->>DB: Partnerschaft als aktiv eintragen und Anteile belegen
        Plattform->>DB: Hofrabatt für Kunden aktivieren
        Note over DB: Eintrag der aktiven Partnerschaft löst die Abbuchung aus.
        Note over Plattform,DB: Abbuchung und Kündigung werden in separaten Sequenzdiagrammen behandelt.
        Plattform-->>Kunde: Annahme und aktive Partnerschaft bestätigen
    else Landwirt lehnt Anfrage ab
        Landwirt->>Plattform: Anfrage ablehnen
        Plattform->>DB: Anfrage als „Abgelehnt“ speichern
        Note over Plattform,DB: Keine aktive Partnerschaft, keine Abbuchung, kein Rabatt und keine belegten Anteile.
        Plattform-->>Kunde: Ablehnung mitteilen
    else Landwirt antwortet, ohne die Anfrage anzunehmen
        Landwirt->>Plattform: Nachricht zur Anfrage senden
        Plattform->>DB: Nachricht speichern; Anfrage bleibt inaktiv
        Plattform-->>Kunde: Nachricht weiterleiten
    end
    opt Landwirt veröffentlicht ein neues Weide-Update
        Landwirt->>Plattform: Update zum Tier veröffentlichen
        Plattform->>DB: Update speichern
        Plattform-->>Kunde: Aktualisierte Informationen anzeigen
    end
```

## Offene fachliche Punkte

- **Prototyp-Abweichung:** `Praesentation/Website App/V5.html` aktiviert die Partnerschaft, belegt Anteile und hinterlegt den Rabatt schon beim Absenden der Kundenanfrage. Das widerspricht der festgelegten Regel, dass erst die Annahme durch den Landwirt eine aktive Partnerschaft erzeugt. Der Prototyp müsste entsprechend angepasst werden.
- **Gegenleistung:** Rabatt, Produkte, Tierinformationen und weitere Vorteile sind noch nicht verbindlich festgelegt. Die V5-Beispiele mit Rabatt und gelegentlichen Hofprodukten sollten daher nicht als allgemeingültiger Anspruch verstanden werden.
- **Rechts- und Rollenmodell:** Eigentum, Beteiligung oder reine Förderung sowie die Pflichten von Landwirt und Plattform müssen noch entschieden werden.
- **Zahlungs- und Kündigungsdetails:** Der aktive Partnerschaftseintrag löst die Abbuchung aus. Der Abbuchungsablauf und der Kündigungsablauf sind separate Diagramme und daher hier nicht weiter ausgeführt.

## Quellen

- [Brainstorming: LocalBite](../../../../Brainstorming/LocalBite.md)
- [Definitionen: Offene Fragen und aktueller Stand](../../../../Definitionen/00_LocalBite_Offene_Definitionen_und_Fragen_Aktueller_Stand.md)
- [Website-Prototyp V5](../../../../Praesentation/Website%20App/V5.html)
- [Teamzuordnung](../../../../UML_Klassendiagramme/Teamzuordnung.md)
