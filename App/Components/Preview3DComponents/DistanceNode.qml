import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

import App.Style

AnimatedNode {
    id: distanceNode

    property alias cubeA: cubeA
    property alias cubeB: cubeB


    Cube {
        id: cubeA
        text: "Cube A"
        color: ColorPalette.green
        position: calculatorStack.distanceOperation.cubeA.position
    }

    Cube {
        id: cubeB
        text: "Cube B"
        color: ColorPalette.purple
        position: calculatorStack.distanceOperation.cubeB.position
    }

    DistanceLine {
        from: cubeA.position
        to: cubeB.position
    }

    Node {
        id: __materialLibrary__
    }


}

/*##^##
Designer {
    D{i:0;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
