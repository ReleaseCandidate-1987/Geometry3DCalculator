import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../Controls"

MaterialScrollView {
    id: operatorView
    padding: 8
    default property alias contentItems: clayout.children

    ColumnLayout {
        width: calculatorStack.width - 16
        spacing: 4

        /* Titel der Rechenoperation */
        MaterialLabel {
            text: appSettings.currentOperationName
            font { pointSize: 14; capitalization: "AllUppercase"; bold: true }
        }

        MaterialHorizontalLine { } // Trennlinie

        ColumnLayout { id: clayout; spacing: 8 }
    }

    Component.onCompleted: {
        contentItems.forEach( ( itm ) => itm.Layout.fillWidth = true )
    }
}
