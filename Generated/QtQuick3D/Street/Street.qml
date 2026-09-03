import QtQuick
import QtQuick3D

/*!
    Street

    Stellt ein einzelnes Straßensegment mit einer Größe von
    einem Meter mal einem Meter dar.
*/
Node {
    id: street
    scale.x: 100
    scale.y: 100
    scale.z: 100
    eulerRotation.y: 90

    property url textureData: "maps/textureData.png"

    Model {
        id: fl_che
        objectName: "Fläche"
        source: "meshes/fl_che_001_mesh.mesh"
        materials: [
            street_Texture_material
        ]
    }

    Node {
        id: __materialLibrary__

        Texture {
            id: _0_texture
            generateMipmaps: true
            mipFilter: Texture.Linear
            source: street.textureData
            objectName: "_0_texture"
        }

        PrincipledMaterial {
            id: street_Texture_material
            objectName: "Street_Texture"
            baseColorMap: _0_texture
            roughness: 0.5
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
    }
}

/*##^##
Designer {
    D{i:0;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
