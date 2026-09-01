import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../Controls"

/*!
    TitleBar: Kopfleiste

    Funktionalitäten:
        - Minimieren der Anwendung.
        - Maximieren / Fensteranzeige.
        - Schließen.
        - Bewegung des Fensters mit startSystemMove().
*/
MaterialFrame {
    id: titleBar
    height: 58
    width: Theme.width
    anchors { left: parent.left; right: parent.right; top: parent.top }

    RowLayout {
        anchors.fill: parent

        // Titel der Anwendung
        MaterialLabel {
            leftPadding: 16
            text: Theme.title
            font{ pointSize: 16; bold: true; capitalization: "AllUppercase" }
        }

        Item { Layout.fillWidth: true  } // Spacer

        // Buttons auf der rechten Seite
        // Minimieren der Anwendung.
        MaterialFlatButton {
            icon.source: Icons.remove
            borderVisible: false
            onClicked: window.showMinimized();
        }

        // Maximieren / Fensteranzeige.
        MaterialFlatButton {
            checkable: true
            icon.width: 14; icon.height: 14
            icon.source: checked ? Icons.show_max : Icons.square
            borderVisible: false
            onClicked: {
                if ( !checked )
                    window.showNormal();
                else window.showMaximized();
            }
        }

        // Schließen.
        MaterialFlatButton {
            icon.source: Icons.close
            borderVisible: false
            onClicked: window.close();
        }
    }
}
