import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../Controls"
import "../Formulas"
import MathSymbols

/*!
    DistanceOperation

    Stellt die Benutzeroberfläche zur Berechnung des räumlichen Abstands
    zwischen den beiden Cubes A und B bereit.

    Für beide Cubes können die X-, Y- und Z-Koordinaten eingegeben werden.
    Zusätzlich wird die verwendete euklidische Abstandsformel angezeigt.

    cubeA:
        Zugriff auf die Koordinateneingabe des ersten Cubes.

    cubeB:
        Zugriff auf die Koordinateneingabe des zweiten Cubes.
*/
OperatorView {
    id: distanceOperation

    property alias cubeA: cubeA
    property alias cubeB: cubeB

    readonly property real distance: parseFloat( (cubeB.position.minus(cubeA.position).length() / 100).toFixed(1) )

    /* Koordinateneingabe für den ersten Cube. */
    XYZValues {
        id: cubeA
        title: "Cube A"
        xValue: -2.60
        yValue: 0.5
        zValue: 0
    }

    /* Koordinateneingabe für den zweiten Cube. */
    XYZValues {
        id: cubeB
        title: "Cube B"
        xValue: 2.60
        yValue: 0.5
        zValue: 0
    }

    /* Anzeige der Formel zur Berechnung des räumlichen Abstands. */
    FormulaPreview { contentItems: DistanceFormula { } }

    MaterialContainer {
        title: "Ergebnis"
        MaterialLabel {
            text: distanceOperation.distance + "m"
        }
    }
}


