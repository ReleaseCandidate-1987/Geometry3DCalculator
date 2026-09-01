import QtQuick
import QtQuick3D

/*!
    AnimatedNode:

    Beim erstellen dieses Nodes werden folgende Eingeschaften animiert:
        - scale: von 0.8 bis 1
        - eulerRotation.y: von 45° bis 0°
        [- opacity: von 0 bis 1] <- vorerst deaktiviert
*/
Node {
    id: node
    Vector3dAnimation on scale {
        from: Qt.vector3d(0.8, 0.8, 0.8)
        to: Qt.vector3d(1, 1, 1)
        duration: 500
        easing.type: "InSine"
    }

    NumberAnimation on eulerRotation.y {
        from: 45; to: 0
        duration: 500
        easing.type: "InSine"
    }

    // NumberAnimation on opacity {
    //     from: 0; to: 1
    //     duration: 500
    //     easing.type: "InSine"
    // }

    // DistanceLine {
    //     id: distanceLine
    // }
}
