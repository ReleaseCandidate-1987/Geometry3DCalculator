import QtQuick
import QtQuick.Controls

import "Components"

/*!
  Hauptseite der Anwendung des Geometry3D-Rechners.

  Besteht aus:
    - TitleBar: Kopfleiste für Fenster-Operationen.
    - SelectionBar: Seiteleiste auf der linken Seite für die Auswahl der Rechenoperation.
    - CalculatorStack: Seitenleiste auf der rechten Seite welche verschiedene Rechenoperationen ausführt.
    - Preview3D: 3D-Komponente in der Mitte zur Visualisierung der Rechenoperationen.
*/
Rectangle {
    id: app
    width: Theme.width
    height: Theme.height
    color: ColorPalette.background

    /* AppSettings: vordefinierte Anwendungseinstellungen */
    AppSettings { id: appSettings }

    // Responsive { id: responsive }  //

    /* Preview3D: 3D-Komponente in der Mitte zur Visualisierung der Rechenoperationen. */
    Preview3D { id: preview3D }

    /* TitleBar: Kopfleiste für Fenster-Operationen. */
    TitleBar { id: titleBar }

    /* SelectionBar: Seiteleiste auf der linken Seite für die Auswahl der Rechenoperation. */
    SelectionBar { id: selectionBar }

    /* CalculatorStack: Seitenleiste auf der rechten Seite welche verschiedene Rechenoperationen ausführt. */
    CalculatorStack { id: calculatorStack }

}
