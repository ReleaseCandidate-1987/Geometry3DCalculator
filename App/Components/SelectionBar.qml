import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../Controls"

/*!
    SelecitonBar: Linke Seitenleiste

    Enthält die Auwahl der folgenden Rechenoperationen:
        - Länge
        - Abstand
        - Winkel
        - Rotation
        - Skalarprodukt
        - Geschwindigkeit
*/
MaterialFrame {
    id: selectionBar
    height: clayout.implicitHeight + 16
    width: 58
    anchors.left: parent.left
    anchors.top: titleBar.bottom

    anchors.margins: 8

    property int currentIndex: appSettings.currentIndex

    /*
        ButtonGroup verwaltet alle vorhandenen Rechenoparationen und wählt beim Start über
        den currentIndex den Button aus.
    */
    ButtonGroup {
        id: grp
        buttons: Array.from( { length: repeater.count }, ( _, i ) => repeater.itemAt( i ) )
        onClicked: function( btn ) {
            appSettings.currentIndex = buttons.indexOf( btn );
            appSettings.currentOperationName = btn.text;
        }

        // Beim Start der Anwendung den Button auf dem currentIndex clicken.
        Component.onCompleted: { buttons[appSettings.currentIndex].checked = true; }
    }

    ColumnLayout {
        id: clayout
        anchors.fill: parent
        anchors.margins: 8
        spacing: 4

        /* Wiederholte Azeige aller verfügbaren Rechenoperationen. */
        Repeater {
            id: repeater
            model: [
                { name: "Länge", icon: Icons.length },
                { name: "Abstand", icon: Icons.distance },
                { name: "Winkel", icon: Icons.angle },
                { name: "Rotation", icon: Icons.rotation },
                { name: "Skalarprodukt", icon: Icons.skalar },
                { name: "Geschwindigkeit", icon: Icons.velocity },
            ]

            MaterialFlatButton {
                checkable: true
                Layout.fillWidth: true
                icon.width: 32; icon.height: 32
                text: modelData.name
                icon.source: modelData.icon
                display: "IconOnly"
                font.pointSize: 8
                leftPadding: 0; rightPadding: 0; topPadding: 0; bottomPadding: 0
                toolTipText: text
                toolTipX: width + 8
                toolTipY: 0
            }
        }

        Item { Layout.fillHeight: true } // Spacer
    }
}
