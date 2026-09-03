import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import App.Style

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
        scale.x: 1 * (calculatorStack.lengthOperation.pipeLength )

        Model {
            id: lengthLine

            property vector3d from: Qt.vector3d(
                                        pipeModel.bounds.minimum.x,
                                        pipeModel.bounds.maximum.y + 0.3,
                                        (pipeModel.bounds.minimum.z + pipeModel.bounds.maximum.z) / 2
                                        )
            property vector3d to: Qt.vector3d(
                                      pipeModel.bounds.maximum.x,
                                      pipeModel.bounds.maximum.y + 0.3,
                                      (pipeModel.bounds.minimum.z + pipeModel.bounds.maximum.z) / 2
                                      )

            geometry: ProceduralMesh {
                primitiveMode: ProceduralMesh.Lines
                positions: [ lengthLine.from, lengthLine.to ]
            }

            materials: DefaultMaterial {
                diffuseColor: ColorPalette.yellow
                lighting: DefaultMaterial.NoLighting
                lineWidth: 3
            }

            Model {
                scale: Qt.vector3d(0.0005 / pipeModel.scale.x , 0.0005, 0.0005)
                position: lengthLine.from
                source: "#Sphere"
                materials: [ PrincipledMaterial { baseColor: ColorPalette.yellow } ]
            }
            Model {
                scale: Qt.vector3d(0.0005 / pipeModel.scale.x , 0.0005, 0.0005)
                position: lengthLine.to
                source: "#Sphere"
                materials: [ PrincipledMaterial { baseColor: ColorPalette.yellow } ]
            }

            Node {
                position: lengthLine.from.plus(lengthLine.to).times(0.5)
                scale: Qt.vector3d(0.01 / pipeModel.scale.x ,0.01,0.01)


                Text {
                    anchors.centerIn: parent
                    text: calculatorStack.lengthOperation.result + "m"
                    color: ColorPalette.yellow
                    font.pixelSize: 18
                    anchors.verticalCenterOffset: -10
                }
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
