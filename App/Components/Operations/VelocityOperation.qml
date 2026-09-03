import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../Controls"
import "../Formulas"
import MathSymbols

/*!
    VelocityOperation

    Stellt die Eingaben und das Ergebnis der Geschwindigkeitsberechnung bereit.

    distance:
        Länge der zurückgelegten Strecke in Metern.

    flightTime:
        Zeit, welche die Kugel für die Strecke benötigt.

    velocity:
        Berechnete Geschwindigkeit in Metern pro Sekunde.
*/
OperatorView {
    id: velocityOperation

    property int distance: distanceSb.value
    property real flightTime: flightTimeSb.value

    readonly property real velocity:
        velocityOperation.distance / velocityOperation.flightTime

    MaterialContainer {
        id: velocityValues
        title: "Bewegung"

        MaterialSpinBox {
            id: distanceSb
            title: "Strecke (m)"
            from: 1
            to: 10
            value: 1
            Layout.fillWidth: true
            Layout.preferredHeight: 42
        }

        MaterialDoubleSpinBox {
            id: flightTimeSb
            title: "Zeit (s)"
            from: 0.1
            to: 10
            value: 1
            stepSize: 0.1
            Layout.fillWidth: true
            Layout.preferredHeight: 42
        }
    }

    FormulaPreview { resultText: "v ="; contentItems: VelocityFormular { } }

    MaterialContainer {
        title: "Ergebnis"

        MaterialLabel {
            Layout.alignment: Qt.AlignHCenter
            text: parseFloat(velocityOperation.velocity.toFixed(1)) + " m/s"
        }
    }
}
