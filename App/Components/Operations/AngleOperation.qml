import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../Controls"
import "../Formulas"
import MathSymbols

/*!
    AngleOperation

    Berechnet den kleineren Winkel zwischen dem linken und dem rechten Arm.
*/
OperatorView {
    id: angleOperation

    property alias armLeftRotation: armLeft.value
    property alias armRightRotation: armRight.value

    readonly property real rotationDifference:
        Math.abs(armRightRotation - armLeftRotation) % 360

    readonly property real angle:
        Math.min(rotationDifference, 360 - rotationDifference)

    MaterialContainer {
        id: angles
        title: "Rotationen"

        MaterialSpinBox {
            id: armLeft
            title: "Linker Arm"
            from: -360
            to: 360
            Layout.fillWidth: true
            Layout.preferredHeight: 42
        }

        MaterialSpinBox {
            id: armRight
            title: "Rechter Arm"
            from: -360
            to: 360
            Layout.fillWidth: true
            Layout.preferredHeight: 42
        }
    }

    FormulaPreview { resultText: "α ="; contentItems: AngleFormula { } }

    MaterialContainer {
        title: "Ergebnis"

        MaterialLabel {
            Layout.alignment: Qt.AlignHCenter
            text: parseFloat(angleOperation.angle.toFixed(1)) + "°"
        }
    }
}
