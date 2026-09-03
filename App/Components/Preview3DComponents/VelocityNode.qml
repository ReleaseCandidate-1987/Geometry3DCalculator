import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

import App.Style
import Generated.QtQuick3D.Street

/*!
    VelocityNode

    Stellt die zur Geschwindigkeitsberechnung gehörende 3D-Szene dar.

    Für jeden Meter der eingestellten Strecke wird ein Straßensegment
    erzeugt. Die Kugel bewegt sich innerhalb der eingestellten Zeit vom
    Anfang bis zum Ende der Straße und beginnt danach erneut am Anfang.
*/
AnimatedNode {
    id: velocityNode

    Repeater3D {
        id: repeater3D
        model: calculatorStack.velocityOperation.distance

        readonly property real dist: count * 50

        Street {
            id: street
            x: repeater3D.dist - 50 - index * 100
        }
    }

    Model {
        id: sphere
        source: "#Sphere"
        y: 20
        scale: Qt.vector3d(0.2, 0.2, 0.2)

        materials: DefaultMaterial {
            diffuseColor: ColorPalette.accent
            lighting: DefaultMaterial.NoLighting
        }

        NumberAnimation on x {
            from: -repeater3D.dist
            to: repeater3D.dist
            duration: calculatorStack.velocityOperation.flightTime * 1000
            easing.type: Easing.Linear
            loops: Animation.Infinite
            running: true
        }
    }
}
