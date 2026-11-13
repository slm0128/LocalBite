Für die Planung und Modellierung unserer LocalBite-Plattform haben wir verschiedene Diagramme erstellt. Diese dienen dazu, die Geschäftsprozesse, die Funktionen des Systems sowie dessen strukturellen Aufbau übersichtlich darzustellen.

*BPMN-Diagramme*

Zur Darstellung unserer Geschäftsprozesse haben wir insgesamt zehn BPMN-Diagramme erstellt. Diese veranschaulichen die einzelnen Abläufe innerhalb der geplanten LocalBite-Plattform und zeigen, welche Aufgaben von den beteiligten Akteuren übernommen werden. Dabei werden die Prozessschritte, Entscheidungen und deren Reihenfolge dargestellt.

Unsere BPMN-Diagramme behandeln folgende Prozesse:

- 01 - Kundenkonto anlegen (erstellt von Mika Kuschel/ Aaron Rock)

- 02 - Abo verwalten (erstellt von Mika Kuschel/ Aaron Rock)

- 02b - Zahlungsdaten prüfen Subprozess (erstellt von Mika Kuschel/ Aaron Rock)

- 03 - Abrechnung und Rechnungsstellung (erstellt von Mika Kuschel/ Aaron Rock)

- 04 - Reklamation und Support (erstellt von Mika Kuschel/ Aaron Rock)

- 05 - Routenplanung und Freigabe (erstellt von Leon Vogel)

- 06 - Fahrer und Fahrzeugzuweisung mit Routendurchführung (erstellt von Leon Vogel)

- 07 - Retouren und Pfandmanagement (erstellt von Leon Vogel)

-	08 - Onboarding Landwirt (erstellt von Esra Karakus/ Selim Kalinci)

-	09 - Box und Lieferantenmanagement (erstellt von Esra Karakus/ Selim Kalinci)

-	10 - Wareneingang und Qualitätskontrolle (erstellt von Esra Karakus/ Selim Kalinci)

Die Prozesse werden mithilfe von Pools und Lanes strukturiert, wodurch die verschiedenen Beteiligten und ihre jeweiligen Aufgaben voneinander abgegrenzt werden. Ergänzend werden Ereignisse, Aktivitäten, Nachrichten und Datenobjekte verwendet, um die Abläufe nachvollziehbar darzustellen.

Als Beispiel wird im Folgenden das BPMN-Diagramm zum Prozess „Kundenkonto anlegen“ dargestellt. Es zeigt den Ablauf von der ersten Anfrage des Kunden bis zur erfolgreichen Erstellung seines Kontos. Dabei werden sowohl die Aufgaben des Kunden als auch die internen Abläufe von LocalBite berücksichtigt. Dazu gehören unter anderem das Übermitteln und Validieren der Formulardaten, die Anlage des Kundenkontos sowie die anschließende E-Mail-Verifizierung. Falls Angaben fehlen oder die Verifizierung nicht innerhalb von 24 Stunden erfolgt, werden entsprechende alternative Abläufe berücksichtigt.

#figure(
  image(
    "../../Assets/Bilder/Selim/BPMN_Kundenkonto_anlegen.png",
    width: 100%,
  ),
  caption: [BPMN-Diagramm: Kundenkonto anlegen],
)

#v(1em)
*Use-Case-Diagramm*

Ergänzend zu den BPMN-Diagrammen haben wir ein UML-Use-Case-Diagramm erstellt. Dieses gibt einen Überblick über die wichtigsten Funktionen unserer LocalBite-Plattform und zeigt, welche Akteure mit dem System interagieren können.

Dabei unterscheiden wir zwischen zwei Hauptakteuren: dem Kunden und dem Landwirt. Der Kunde kann beispielsweise ein Kundenkonto anlegen und verwalten, das Produktangebot ansehen, eine Wochenbestellung zusammenstellen und aufgeben sowie seine Abonnements und Bestellhistorie verwalten. Darüber hinaus kann er Lieferungen verfolgen, Reklamationen einreichen, Spenden tätigen, Bewertungen abgeben, Tierpartnerschaften verwalten und den Support kontaktieren.

Der Landwirt kann ebenfalls ein eigenes Konto anlegen und verwalten. Zu seinen Funktionen gehören das Verwalten des Produktangebots, das Aktualisieren der Bestände sowie das Einsehen zugehöriger Bestellungen und geplanter Abholungen. Außerdem kann er Bestellungen als abholbereit melden, erhaltene Bewertungen einsehen und Tierpartnerschaftsangebote verwalten.

Die Funktion „Tierpartnerschaft verwalten“ ist dabei sowohl mit dem Kunden als auch mit dem Landwirt verbunden, da beide Seiten an einer solchen Partnerschaft beteiligt sind. Während Landwirte Tierpartnerschaften anbieten und verwalten können, haben Kunden die Möglichkeit, diese auszuwählen und anzufragen.

Das Use-Case-Diagramm verdeutlicht somit, welche Funktionen unsere Plattform bereitstellen soll und welche Aufgaben den jeweiligen Akteuren zugeordnet sind.

#figure(
  image(
    "../../Assets/Bilder/Selim/UseCase.png",
    width: 72%,
  ),
  caption: [Use-Case-Diagramm],
)

#v(1em)
*Sequenzdiagramme*

Zusätzlich haben wir fünf UML-Sequenzdiagramme erstellt. Diese stellen dar, wie verschiedene Objekte und Klassen innerhalb eines bestimmten Anwendungsfalls miteinander kommunizieren. Dabei wird der zeitliche Ablauf der einzelnen Nachrichten und Methodenaufrufe veranschaulicht.

Unsere Sequenzdiagramme behandeln folgende Anwendungsfälle:

-	Bestellung aufgeben (erstellt von Mika Kuschel)

-	Bewertung abgeben (erstellt von Esra Karakus)

-	Produktangebot verwalten (erstellt von Leon Vogel)

-	Tierpartnerschaft eingehen und verwalten (erstellt von Aaron Rock)

-	Benutzerkonto anlegen (erstellt von Selim Kalinci)

Die Sequenzdiagramme helfen uns dabei, die Abläufe innerhalb der einzelnen Anwendungsfälle genauer zu beschreiben. Gleichzeitig zeigen sie, welche Klassen miteinander interagieren und welche Methoden für die jeweiligen Funktionen benötigt werden. Die dargestellten Methodenaufrufe verdeutlichen somit auch, welche Aufgaben die einzelnen Klassen innerhalb eines Ablaufs übernehmen.

Als Beispiel wird das Sequenzdiagramm zum Anwendungsfall „Benutzerkonto anlegen“ dargestellt. Es zeigt die Kommunikation zwischen dem Benutzer, der GUI, der Benutzerverwaltung sowie den Klassen Kunde und Landwirt. Je nach ausgewähltem Benutzertyp wird entweder ein Kunden- oder ein Landwirtkonto erstellt. Dabei werden die entsprechenden Objekte angelegt und über die Benutzerverwaltung in das System aufgenommen. Außerdem werden mögliche Erfolgs- und Fehlermeldungen berücksichtigt.

#figure(
  image(
    "../../Assets/Bilder/Selim/Sequenzdiagramm_Benutzerkonto.png",
    width: 80%,
  ),
  caption: [UML-Sequenzdiagramm: Benutzerkonto anlegen],
)

*Klassendiagramm*

Ein weiteres wichtiges Artefakt ist unser UML-Klassendiagramm. Es stellt den strukturellen Aufbau der LocalBite-Plattform dar und zeigt die verschiedenen Klassen sowie deren Beziehungen untereinander.

Das Klassendiagramm umfasst sowohl fachliche Klassen als auch Verwaltungsklassen. Zu den fachlichen Klassen gehören beispielsweise Benutzer, Kunde, Landwirt, Fahrer, Fahrzeug, Route, Bestellung, Bestellposition, Produkt, Bewertung, Spende, Abo, Reklamation, Tier und Tierpartnerschaft. Diese bilden die zentralen Objekte und Datenbereiche unserer Plattform ab. Die Klasse Benutzer ist dabei als abstrakte Klasse definiert und bildet die gemeinsame Grundlage für die verschiedenen Benutzerarten Kunde, Landwirt und Fahrer.

Ergänzend dazu gibt es verschiedene Verwaltungsklassen, darunter Benutzerverwaltung, Bestellverwaltung, Routenverwaltung, Reklamationsverwaltung, Produktverwaltung und TP_Verwaltung. Diese dienen als Container für die jeweiligen Funktionsbereiche und bündeln die zugehörigen Verwaltungsaufgaben. Die GUI bildet die Schnittstelle zur Benutzeroberfläche und greift auf diese Verwaltungsklassen zu, um die entsprechenden Funktionen des Systems bereitzustellen.

Die dargestellten Beziehungen verdeutlichen die Zusammenhänge zwischen den fachlichen Klassen. Beispielsweise kann ein Kunde mehrere Bestellungen aufgeben und Bewertungen abgeben. Eine Bestellung besteht aus mehreren Bestellpositionen, die jeweils einem Produkt zugeordnet sind. Auch die Beziehungen zwischen Kunden, Landwirten und Tierpartnerschaften werden im Klassendiagramm veranschaulicht.

Die Ausarbeitung der Klassen erfolgte in mehreren Kleingruppen. Dabei wurden den jeweiligen Gruppen bestimmte Klassen zugeteilt, die sie gemeinsam bearbeiteten. Aaron Rock und Mika Kuschel übernahmen die Klassen Bestellposition, Produkt, Abo, Tier und TP_Verwaltung. Leon Vogel beschäftigte sich mit Bestellung, Bestellverwaltung, Reklamation, Reklamationsverwaltung, Route, Routenverwaltung und Produktverwaltung. Selim Kalinci und Esra Karakus übernahmen die Klassen Benutzerverwaltung, Benutzer, Landwirt, Kunde, Fahrer, Fahrzeug, Tierpartnerschaft, Bewertung und Spende. Die Gestaltung und Ausarbeitung der GUI erfolgte gemeinschaftlich durch alle Gruppenmitglieder.

Insgesamt bietet das Klassendiagramm einen Überblick über die objektorientierte Struktur unserer LocalBite-Plattform und zeigt, wie die einzelnen Klassen und Verwaltungsbereiche miteinander zusammenhängen.
