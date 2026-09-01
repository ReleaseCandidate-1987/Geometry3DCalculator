import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../Controls"
import "Operations"

/*!
  CalculatorStack: Rechte Seitenleiste

  Wechselt zwischen den Rechenoperationen der SelectionBar und zeigt dessen
  Auswahl an.
*/
MaterialFrame {
    id: calculatorStack
    width: 330

    anchors {
        right: parent.right; top: titleBar.bottom; bottom: parent.bottom;
        margins: 8
    }

    property alias lengthOperation: lengthOperation
    property alias distanceOperation: distanceOperation
    property alias angleOperation: angleOperation
    property alias rotationOperation: rotationOperation
    property alias skalarOperation: skalarOperation
    property alias velocityOperation: velocityOperation

    /* Zeigt die ausgewählte Rechenoperation an. */
    StackLayout {
        anchors.fill: parent
        currentIndex: appSettings.currentIndex

        /* Berechnung der Länge */
        LengthOperation { id: lengthOperation }

        /* Berechnung des Abstands */
        DistanceOperation { id: distanceOperation }

        /* Berechnung des Winkels */
        AngleOperation { id: angleOperation }

        /* Berechnung der Rotation */
        RotationOperation { id: rotationOperation }

        /* Berechnung des Skalarproduktes */
        SkalarOperation { id: skalarOperation }

        /* Berechnung der Geschwindigkeit */
        VelocityOperation { id: velocityOperation }
    }



}

