Für LocalBite planen wir eine digitale Plattform, auf der verschiedene Nutzergruppen wie Kunden, Landwirte und Fahrer ihre jeweiligen Aufgaben erledigen können. 
Die fachliche Grundlage unserer Plattform bildeten BPMN-Diagramme zur Darstellung der Geschäftsprozesse sowie UML-Diagramme zur Beschreibung der Funktionen, Systemstruktur und Abläufe. Wie wir die einzelnen Modelle entwickelten und aufeinander abstimmten, beschreiben wir in #link(<konzeption-design>)[Kapitel 3.3.1] genauer.
Um unsere Idee auch praktisch und anschaulich präsentieren zu können, entwickelten wir zusätzlich einen interaktiven Webseiten-Mockup mit verschiedenen Ansichten und der Möglichkeit, zwischen den Nutzerrollen zu wechseln. Auf eine vollständige Backend- und Datenbankanbindung verzichteten wir in dieser frühen Entwicklungsphase bewusst, um zunächst den Fokus auf die Konzeption und Darstellung unserer Idee zu legen und gleichzeitig den Entwicklungsaufwand sowie mögliche Kosten gering zu halten.

Für die Erstellung der verschiedenen Diagramme verwendeten wir hauptsächlich zwei Programme. Die BPMN-Diagramme erstellten wir mit dem Camunda Modeler, während wir Visual Paradigm für die UML-Diagramme einsetzten. Um gleichzeitig an unterschiedlichen Aufgaben arbeiten zu können, verwendeten wir Git und GitHub zur Versionsverwaltung. Dabei arbeiteten wir teilweise auf eigenen Branches und führten die Ergebnisse anschließend wieder zusammen. Für die Umsetzung unseres interaktiven Webseiten-Mockups kamen HTML, CSS und JavaScript zum Einsatz.

Ursprünglich hatten wir geplant, eine lokal ausführbare Webanwendung mit dem Framework Svelte zu entwickeln. Während der Umsetzung stellten wir jedoch fest, dass der technische Aufwand für diese frühe Projektphase zu hoch war. Deshalb entschieden wir uns, zunächst auf eine einfachere Webseiten-Variante zu setzen. So konnten wir uns stärker auf die Darstellung unserer Geschäftsidee und die wichtigsten Funktionen konzentrieren, ohne bereits eine vollständige Anwendung entwickeln zu müssen. Da sich die Anforderungen und Vorstellungen der Stakeholder im weiteren Projektverlauf noch ändern können, hielten wir es für sinnvoller, zunächst die grundlegenden Funktionen und Abläufe festzulegen, anstatt bereits viel Zeit in technische Details zu investieren.

/*
Dieser Abschnitt stellt die fachliche Architektur von LocalBite sowie die eingesetzten Werkzeuge und Technologien vor. Die getroffene Auswahl wird jeweils kurz begründet.

----

Architektur

- Konzeption einer digitalen LocalBite-Plattform mit verschiedenen Nutzerrollen (Kunde, Landwirt und Fahrer).
- Modellierung der Geschäftsprozesse und Abläufe durch BPMN.
- Darstellung der Systemstruktur, Klassen und ihrer Beziehungen durch UML (Klassen und Sequenzdiagramm).
- Entwicklung eines interaktiven Webseiten-Mockups mit mehreren Ansichten und Rollenwechsel.
- Keine vollständige Backend- oder Datenbankanbindung (nicht gefordert)


Technologischer Stack:

- Visual Paradigm: Erstellung der UML-Diagramme.
- Camunda Modeler: Erstellung der BPMN-Diagramme.
- Git und GitHub: Versionsverwaltung, Zusammenarbeit über eigene Branches und Zusammenführung der Ergebnisse.
- HTML, CSS und JavaScript: Umsetzung des interaktiven Webseiten-Mockups.
- Ursprünglicher Ansatz: Erprobung einer lokal ausführbaren Webanwendung ueber Svelte, anschließend bewusste Entscheidung für ein vereinfachtes Mockup.

Damit ist 3.2 inhaltlich gut vorbereitet. Die Aufteilung ist sinnvoll: Architektur beschreibt, was ihr konzipiert und wie ihr es strukturiert habt, während der technologische Stack die tatsächlich eingesetzten Werkzeuge und Technologien nennt.
*/