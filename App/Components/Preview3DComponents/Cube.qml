import QtQuick
import QtQuick3D

import "../../Controls"

/*!
    Stellt einen Würfel mit transparenten Innenflächen darf.
*/
import Generated.QtQuick3D.Pipe
Model {
    id: cube
    source: "#Cube"
    property color color: ColorPalette.accent
    property string text: "Cube"

    // Text-Node
    Node {
        eulerRotation.x: -90
        y: cube.bounds.minimum.y
        MaterialLabel {
            anchors.centerIn: parent
            text: cube.text
            font.pixelSize: 18
            color: ColorPalette.foregroundDisabled
            antialiasing: true
        }
    }

    materials: [
        PrincipledMaterial {
            objectName: ""
            alphaMode: PrincipledMaterial.Blend
            cullMode: Material.NoCulling

            baseColorMap:  Texture {
                objectName: ""
                sourceItem: Item {
                    width: 100
                    height: 100
                    Rectangle {
                        anchors.fill: parent
                        color: cube.color
                        opacity: 0.15
                    }
                    Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        border.width: 2
                        border.color: Qt.darker(cube.color, 1.5)
                        opacity: 1
                    }
                }
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
