import QtQuick
import QtQuick.Layouts
import QtQuick3D
import "../../Controls"


/*!
  XYZValues

  Nimmt XYZ Koordinaten entgegen und verarbeitet diese.
  Zusätzlich wird ein Titel vergeben.
*/
MaterialContainer {
    id: xYZValues

    property alias xValue: xValue.value
    property alias yValue: yValue.value
    property alias zValue: zValue.value
    property vector3d position: Qt.vector3d( xValue.value, yValue.value, zValue.value ).times( 100 )

    // X-Achse
    MaterialDoubleSpinBox {
        id: xValue
        title: "X"
        Layout.preferredHeight: 42
        Layout.fillWidth: true
        from: -10
        to: 10
    }

    // Y-Achse
    MaterialDoubleSpinBox {
        id: yValue
        title: "Y"
        Layout.preferredHeight: 42
        Layout.fillWidth: true
        from: -10
        to: 10
    }

    // Z-Achse
    MaterialDoubleSpinBox {
        id: zValue
        title: "Z"

        Layout.preferredHeight: 42
        Layout.fillWidth: true
        from: -10
        to: 10
    }

}
