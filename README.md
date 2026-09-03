# Geometry3DCalculator

<img width="1680" height="896" alt="Geometry3DCalculator" src="https://github.com/user-attachments/assets/d2319208-b14b-4e68-8927-09d4ed1671e2">

Geometry3DCalculator ist eine mit Qt/QML und Qt Quick 3D entwickelte Anwendung zur Darstellung mathematischer Berechnungen im dreidimensionalen Raum.

Abhängig von der ausgewählten Rechenoperation wird eine passende 3D-Szene geladen. Die Eingabewerte können direkt verändert werden. Das berechnete Ergebnis und die dazugehörige mathematische Formel werden anschließend in der Benutzeroberfläche angezeigt.

<img width="323" height="97" alt="Darstellung einer mathematischen Formel" src="https://github.com/user-attachments/assets/d1e0503d-09e7-49dd-9d99-5aba14554e0f">

> [!IMPORTANT]
> Die mathematischen Symbole stammen aus der externen QML-Komponentensammlung `MathSymbols`. Diese ist nicht Bestandteil dieses Repositories und muss über den QML-Importpfad eingebunden werden.

## Funktionen

### Abstand

Berechnet den räumlichen Abstand zwischen den Mittelpunkten zweier Würfel.

* Eingabe der X-, Y- und Z-Koordinaten beider Würfel
* Direkte Aktualisierung der Positionen in der 3D-Szene
* Verbindungslinie zwischen beiden Mittelpunkten
* Darstellung der euklidischen Abstandsformel
* Ausgabe des berechneten Abstands in Metern

### Länge

Berechnet und visualisiert die Länge eines Rohres mit einer Basislänge von zehn Metern.

* Veränderbarer Ausdehnungsfaktor
* Anpassung der Rohrlänge in der 3D-Szene
* Markierung von Anfang und Ende des Rohres
* Messlinie entlang des Rohres
* Darstellung der verwendeten Formel
* Ausgabe der berechneten Länge in Metern

### Winkel

Berechnet und visualisiert den Winkel zwischen zwei Armen eines Gelenks.

* Getrennte Rotation des linken und rechten Gelenkarms
* Gemeinsamer Drehpunkt am Gelenk
* Direkte Aktualisierung der 3D-Szene
* Darstellung der mathematischen Winkelformel
* Ausgabe des berechneten Winkels

### Geschwindigkeit

Berechnet und visualisiert die Geschwindigkeit eines animierten Objekts auf einer festgelegten Strecke.

* Veränderbare Länge der Strecke
* Darstellung der Strecke aus einzelnen Straßenelementen
* Animierte Kugel entlang der Straße
* Wiederholte Animation vom Anfang bis zum Ende der Strecke
* Berechnung der Geschwindigkeit aus Strecke und Zeit
* Darstellung der Geschwindigkeitsformel
* Ausgabe des berechneten Ergebnisses

## 3D-Darstellung

Die 3D-Vorschau basiert auf Qt Quick 3D und enthält:

* dynamisch geladene 3D-Szenen für die ausgewählte Rechenoperation
* perspektivische Kamera
* Kamerazoom über das Mausrad
* Orientierungsgitter auf der XZ-Ebene
* prozedural erzeugte Messlinien
* Markierungen und Beschriftungen innerhalb der Szene
* direkte Aktualisierung der Modelle anhand der Eingabewerte

## Tests

Die Anwendung verwendet Qt Quick Test. Derzeit wird die Abstandsberechnung zwischen zwei Würfeln getestet.

Die vorhandenen Tests überprüfen:

* die voreingestellten Koordinaten und das daraus berechnete Ergebnis
* die Berechnung unter Verwendung der X-, Y- und Z-Achse
* den Abstand zwischen zwei identischen Positionen
* die Rundung des berechneten Ergebnisses

## Voraussetzungen

* Qt 6
* Qt Quick
* Qt Quick Controls
* Qt Quick 3D
* Qt Quick Test
* CMake 3.21 oder neuer
* C++17
* externe QML-Komponentensammlung `MathSymbols`

## Geplante Funktionen

* Abstandsberechnung zwischen den Innenflächen zweier Objekte
* Abstandsberechnung zwischen den Außenflächen zweier Objekte
* Rotation
* Skalarprodukt
* weitere Tests für Länge, Winkel und Geschwindigkeit
