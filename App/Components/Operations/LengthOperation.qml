import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../Controls"
import "../Formulas"
import MathSymbols


/*!
    LengthOperation

    Berechnet die Länge des Rohres anhand seiner Grundlänge
    und des eingestellten Ausdehnungsfaktors.
*/
OperatorView {
    id: lengthOperation

    property alias pipeLength: pipeLength.value

    readonly property real basePipeLength: 10
    readonly property real result: lengthOperation.basePipeLength * lengthOperation.pipeLength

    MaterialContainer {
        id: pipe
        title: "Ausdehnung"

        MaterialDoubleSpinBox {
            id: pipeLength
            title: "Faktor"
            from: 1
            to: 10
            value: 1
            stepSize: 0.1
            Layout.fillWidth: true
            Layout.preferredHeight: 42
        }
    }

    FormulaPreview { resultText: "L ="; contentItems: LengthFormula { } }

    MaterialContainer {
        title: "Ergebnis"

        MaterialLabel {
            Layout.alignment: Qt.AlignHCenter
            text: parseFloat(lengthOperation.result.toFixed(1)) + " m"
        }
    }
}
