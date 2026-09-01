import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

import App.Style

/*!
    DistanceLine

    Stellt eine Linie mit Text ( mittig ) zwischen Zwei Vektoren bereit.
*/
Model {
    id: distanceLine
    
    property vector3d from: Qt.vector3d(0,0,0)
    property vector3d to: Qt.vector3d(0,0,0)
    property string text: "Dinstance"
    property color textColor: ColorPalette.foreground
    property color lineColor: ColorPalette.yellow

    position: from
    
    readonly property vector3d lineVector: to.minus(from)
    
    geometry: ProceduralMesh {
        primitiveMode: ProceduralMesh.Lines
        positions: [Qt.vector3d(0, 0, 0), distanceLine.lineVector]
    }
    
    materials: DefaultMaterial {
        diffuseColor: distanceLine.lineColor
        lighting: DefaultMaterial.NoLighting
        lineWidth: 2
    }
    
    Node {
        position: distanceLine.lineVector.times(0.5)
        
        Text {
            anchors.centerIn: parent
            text: distanceLine.text
            color: distanceLine.textColor
            font.pixelSize: 18
            anchors.verticalCenterOffset: -10
        }
    }
}
