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
    anchors { left: parent.left; right: parent.right; top: parent.top; }
    radius: 0

    /* MouseArea zum Bewegen der TitleBar mit startSystemMove. */
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onDoubleClicked: window.visibility = window.visibility === Window.Windowed ? Window.Maximized : Window.Windowed

        onPositionChanged: {
            if ( !pressed )
                return;

            window.startSystemMove();
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        // Titel der Anwendung
        MaterialLabel {

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
            icon.width: 14; icon.height: 14
            icon.source: window.visibility === Window.Maximized ? Icons.show_max : Icons.square
            borderVisible: false
            onClicked: {
                window.visibility = window.visibility === Window.Windowed ? Window.Maximized : Window.Windowed
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
