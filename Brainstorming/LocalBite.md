# 🧠 Internes Brainstorming & Action Plan: LocalBite
**Dokument für uns als Team:** Was ist unsere Vision? Was müssen wir konkret tun? Welche offenen Fragen gibt es?

---

## 1. 💡 Innovative Features (Unser "Geheimrezept")
*Hier sammeln wir unsere Alleinstellungsmerkmale. Wie setzen wir das um?*

*   [ ] **Community Kochen / Gastro der Bauernhöfe:** 
    *   *Idee:* Kunden können nicht nur Essen bestellen, sondern auch Events/Kochabende auf den Höfen buchen.
    *   *To-Do:* Brauchen wir ein Ticket-System in der App? 
*   [ ] **Animal-Sharing (Tierfinanzierung):** 
    *   *Idee:* Kunde sponsert ein Tier (z.B. ein Schwein/Kuh) und bekommt dafür dauerhaft X% Rabatt auf Produkte dieses Hofes.
    *   *To-Do:* Wie berechnen wir das? Brauchen wir dafür Verträge in der App?
*   [ ] **Autonome Lieferung:** 
    *   *Idee:* Lieferung per Roboter/Drohne (Zukunftsvision). 
    *   *To-Do:* Erstmal als "Vision" im Pitch lassen, für das aktuelle Modellierungs-Projekt vielleicht zu komplex, aber gut für den Ausblick!

---

## 2. 📱 UI/UX & Plattform (Was müssen wir designen/bauen?)

### 🧑‍🌾 Für den Landwirt (Erzeuger-Portal)
*   [ ] **Profil-Erstellung:** Name, Standort, Geschichte des Hofes, Bilder hochladen.
*   [ ] **Angebots-Baukasten:** Wie stellt der Bauer seine Produkte ein? (Inventar-Management).
*   [ ] **Bewertungs-Ansicht:** Wie sieht der Bauer sein Feedback?
*   [ ] **Social Media Automatisierung:** 
    *   *Technisches To-Do:* Wie binden wir die Meta-API an, damit App-Posts automatisch auf Instagram/Facebook landen?

### 👤 Für den Kunden (Genießer-App)
*   [ ] **Profil-Erstellung:** Lieferadresse, Zahlungsdaten, Präferenzen (z.B. "vegetarisch").
*   [ ] **Landkreis-Filter:** 
    *   *Logik:* User gibt PLZ ein -> System zeigt nur Höfe im Umkreis von X km.
*   [ ] **Follow-Funktion:** Ein "Abonnieren"-Button auf dem Hof-Profil.
    *   *Logik:* Wenn Bauer neues Angebot postet -> Push-Nachricht an alle Follower.

---

## 3. ⚙️ BPMN Kernprozesse (Unsere Hausaufgaben für Woche 2-3)
*Das sind die Prozesse, die wir für das Projekt modellieren (mit Pools, Lanes, Gateways).*

**Kunde & Abo:**
*   [ ] 1. Abo / Einkauf abschließen (Onboarding, Zahlung)
*   [ ] 2. Abo verwalten (Pausieren, Ändern)
*   [ ] 3. Abrechnung und Rechnungsstellung
*   [ ] 4. Reklamation und Support

**Logistik:**
*   [ ] 5. Auslieferung und Routing (Wie wird die Route berechnet?)
*   [ ] 6. Fahrermanagement und Abwicklung (Wer fährt wann?)
*   [ ] 7. Retouren und Pfand Management (Boxen zurücknehmen)

**Landwirt:**
*   [ ] 8. Onboarding Landwirt (Wie kommt der Bauer ins System?)
*   [ ] 9. Box und Lieferanten (Bestellungen an die Höfe übermitteln)
*   [ ] 10. Wareneingang und Qualitätsordnung (+ Kundenbewertung)

---

## 4. ❓ Offene Fragen für das nächste Meeting
1.  **Arbeitsteilung:** Wer macht welche BPMN-Diagramme?
2.  **Tools:** Machen wir Wireframes/Mockups für die App? (z.B. in Figma?)
3.  **Animal-Sharing:** Sollen wir dafür einen eigenen kleinen Prozess modellieren oder ist das nur ein Rabatt-Code im System?

---
*Let's build LocalBite! 🚀*