import QtQuick
import QtQuick.Controls
import QtQuick3D
import QtQuick3D.Helpers
import "../Controls"
import "Preview3DComponents"

/*!
    Preview3D stellt die Szene bereit, in der verschiedene 3D-Objekte, passend zur Rechenoperation, dargestellt werden.
*/
import Generated.QtQuick3D.Pipe
import Generated.QtQuick3D.Street
Item {
    id: preview3D
    width: Theme.width
    height: Theme.height
    anchors { fill: parent; margins: 0 }

    property Loader3D operationLoader: operationLoader

    /* Sichtbarer Bereich, in dem die Szene gerendert wird. */
    View3D {
        id: view3D
        anchors.fill: parent
        focus: true
        environment: ExtendedSceneEnvironment {

            // Kantenglättung.
            antialiasingMode: SceneEnvironment.MSAA

            // Szenenhintergrund. SkyBox umschließt die Kamera vollständig.
            backgroundMode: SceneEnvironment.SkyBox

            // Enthält die Umgebungstextur.
            lightProbe: Texture {

                // ProceduralSkyTextureData erzeugt Bilddaten zur Laufzeit.
                textureData: ProceduralSkyTextureData{
                    skyHorizonColor: "#535353"
                    skyTopColor: "#2e2e2e"
                    sunColor: "#c3ff18"
                }
            }
        }

        WheelHandler {
            onWheel: function( ev ) {
                view3DCamera.zoom( ev.angleDelta.y / 120 )
            }
        }

        /* Zeigt ein Grid in der Szene. */
        AxisHelper {
            id: axisHelper
            enableAxisLines: false
            enableXZGrid: true
            gridColor: ColorPalette.border
            gridOpacity: 0.1
        }

        camera: PerspectiveCamera {
            id: view3DCamera
            x: -305.252
            y: 231.646
            eulerRotation.z: 0
            eulerRotation.y: -40.16772
            eulerRotation.x: -23.83386
            z: 423.79648
            lookAtNode: operationLoader.item

            property real zoomStep: 50
            property real minimumDistance: 100
            property real maximumDistance: 2000

            function zoom ( direction ) {
                if ( !operationLoader.item )
                    return;

                const targetPosition = operationLoader.item.scenePosition;
                const cameraOffset = position.minus( targetPosition );
                const currentDistance = cameraOffset.length();

                const newDistance = Math.max( minimumDistance,  Math.min( maximumDistance, currentDistance - direction * zoomStep ) );
                position = targetPosition.plus(cameraOffset.normalized().times(newDistance))
            }
        }

        DirectionalLight {
            id: directionalLight
            x: -0
            y: 306.124
            ambientColor: "#737373"
            castsShadow: false
            eulerRotation.x: -90
            z: -0.00006
        }

        /* Lädt die jeweilige Komponente nach der ausgewählten Rechenoperation. */
        Loader3D {
            id: operationLoader
            sourceComponent: [
                lengthComponent,
                distanceComponent,
                angleComponent,
                //rotationComponent,
                //skalarComponent,
                velocityComponent
            ][appSettings.currentIndex]
        }

        Component { id: lengthComponent; LengthNode { id: lengthNode } }
        Component { id: distanceComponent; DistanceNode { id: distanceNode } }
        Component { id: angleComponent; AngleNode { id: angleNode } }
        //Component { id: rotationComponent; RotationNode { id: rotationNode } }
        //Component { id: skalarComponent; SkalarNode { id: skalarNode } }
        Component { id: velocityComponent; VelocityNode { id: velocityNode } }
    }

    Item {
        id: __materialLibrary__

        PrincipledMaterial {
            id: principledMaterial
            objectName: "New Material"
        }
    }

    BusyIndicator {
        width: 300
        height: 300
        anchors.centerIn: parent
        running: operationLoader.status === Loader3D.Loading
    }
    
}

/*##^##
Designer {
    D{i:0}D{i:1;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:6;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
D{i:11;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:14;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
D{i:23;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:25;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
