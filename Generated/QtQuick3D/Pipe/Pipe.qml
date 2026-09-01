import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

Node {
    id: pipe
    property url textureData: "maps/textureData.jpg"
    scale: Qt.vector3d(100, 100, 100)

    Model {
        id: pipeModel
        objectName: "pipe"
        y: 0.1968214213848114
        source: "meshes/zylinder_002_mesh.mesh"
        materials: pipe_Texture_material

        Model {
            id: lengthLine

            geometry: ProceduralMesh {
                primitiveMode: ProceduralMesh.Lines
                positions: [
                    Qt.vector3d(
                        pipeModel.bounds.minimum.x,
                        pipeModel.bounds.maximum.y + 0.3,
                        (pipeModel.bounds.minimum.z + pipeModel.bounds.maximum.z) / 2
                    ),
                    Qt.vector3d(
                        pipeModel.bounds.maximum.x,
                        pipeModel.bounds.maximum.y + 0.3,
                        (pipeModel.bounds.minimum.z + pipeModel.bounds.maximum.z) / 2
                    )
                ]
            }

            materials: DefaultMaterial {
                diffuseColor: "#ffcc00"
                lighting: DefaultMaterial.NoLighting
                lineWidth: 3
            }
        }
    }

    Node {
        id: __materialLibrary__

        Texture {
            id: _0_texture
            generateMipmaps: true
            mipFilter: Texture.Linear
            source: pipe.textureData
            objectName: "_0_texture"
        }

        PrincipledMaterial {
            id: pipe_Texture_material
            objectName: "Pipe_Texture"
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
