import QtQuick
import QtCore

Settings {
    id: appSettings

    property var initSettings: {
        Qt.application.name = "Geometry3DCalculator"
        Qt.application.domain = "Geometry3DCalculator.de"
        Qt.application.organization = "Geometry3DCalculator_org"
    }

    property bool isDarkMode: true
    property int currentIndex: 0
    property string currentOperationName: "Länge"

    Component.onCompleted: {
        ColorPalette.isDarkMode = isDarkMode;
    }
}
