pragma Singleton
import QtQuick
import QtQuick.Controls.Material

QtObject {
    id: qtObject
    property string title: "Geometry3D Calculator"
    property int width: 1920
    property int height: 1080

    readonly property int globalRadius: Material.SmallScale
    readonly property int backgroundElevation: 12
    property int controlRadius: 8
    readonly property int controlHeight: 42
}
