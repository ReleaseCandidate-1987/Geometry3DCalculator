import QtQuick
import QtQuick3D

Node {
    id: node
    eulerRotation.y: 90
    scale.x: 100
    scale.y: 100
    scale.z: 100

    // Resources

    // Nodes:
    Node {
        id: root
        objectName: "ROOT"
        Model {
            id: armLeft
            objectName: "ArmLeft"
            source: "meshes/w_rfel_001_mesh.mesh"
            eulerRotation.x: calculatorStack.angleOperation.armLeftRotation
            eulerRotation.y: 0
            materials: [
                principledMaterial
            ]
        }
        Model {
            id: armRight
            objectName: "ArmRight"
            eulerRotation.x: calculatorStack.angleOperation.armRightRotation
            scale.x: 1
            scale.y: 1
            scale.z: 1
            source: "meshes/w_rfel_002_mesh.mesh"
            materials: [
                principledMaterial
            ]
        }
        Model {
            id: zylinder
            objectName: "Zylinder"
            source: "meshes/zylinder_mesh.mesh"
            materials: [
                z_Material_material
            ]
        }
    }

    Node {
        id: __materialLibrary__

        PrincipledMaterial {
            id: principledMaterial
            objectName: "principledMaterial"
            metalness: 1
            roughness: 1
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: z_Material_material
            objectName: "Z_Material"
            baseColor: "#ff030303"
            roughness: 0.5
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
    }

    // Animations:
}

/*##^##
Designer {
    D{i:0;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
