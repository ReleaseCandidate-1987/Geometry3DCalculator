import QtQuick
import QtTest
import "../App/Components/Operations"

/*!
    DistanceOperation-Test

    Überprüft die Abstandsberechnung der vorhandenen DistanceOperation.

    Für jeden Test wird eine eigene DistanceOperation erzeugt. Dadurch sind
    die Testfälle voneinander unabhängig und beeinflussen sich nicht gegenseitig.
*/
TestCase {
    id: testCase
    name: "DistanceOperation"

    /* Vorlage zum Erzeugen einer DistanceOperation innerhalb der Tests. */
    Component {
        id: distanceOperationComponent

        DistanceOperation {}
    }

    /*
        Überprüft die voreingestellten Koordinaten der beiden Cubes und den
        daraus berechneten Abstand von 5,2 Metern.
    */
    function test_defaultValues() {
        // Das erzeugte Objekt wird nach Abschluss des Tests automatisch entfernt.
        const operation = createTemporaryObject(distanceOperationComponent, testCase)
        verify(operation !== null)

        compare(operation.cubeA.xValue, -2.60)
        compare(operation.cubeA.yValue, 0.5)
        compare(operation.cubeA.zValue, 0)

        compare(operation.cubeB.xValue, 2.60)
        compare(operation.cubeB.yValue, 0.5)
        compare(operation.cubeB.zValue, 0)

        // Wartet auf die Aktualisierung der Property und vergleicht das Ergebnis.
        tryCompare(operation, "distance", 5.2)
    }

    /*
        Überprüft, ob alle drei Koordinatenachsen in die Berechnung einfließen.

        Für die Differenz (2, 3, 6) ergibt sich:
        sqrt(2² + 3² + 6²) = 7
    */
    function test_distanceUsesAllAxes() {
        const operation = createTemporaryObject(distanceOperationComponent, testCase)
        verify(operation !== null)

        operation.cubeA.xValue = 0
        operation.cubeA.yValue = 0
        operation.cubeA.zValue = 0
        operation.cubeB.xValue = 2
        operation.cubeB.yValue = 3
        operation.cubeB.zValue = 6

        tryCompare(operation, "distance", 7)
    }

    /*
        Überprüft, ob zwei identische Positionen den Abstand null ergeben.
    */
    function test_samePositionsReturnZero() {
        const operation = createTemporaryObject(distanceOperationComponent, testCase)
        verify(operation !== null)

        operation.cubeA.xValue = 2
        operation.cubeA.yValue = 4
        operation.cubeA.zValue = 6

        operation.cubeB.xValue = 2
        operation.cubeB.yValue = 4
        operation.cubeB.zValue = 6

        tryCompare(operation, "distance", 0)
    }

    /*
        Überprüft, ob das berechnete Ergebnis auf eine Nachkommastelle
        gerundet wird.
    */
    function test_distanceIsRounded() {
        const operation = createTemporaryObject(distanceOperationComponent, testCase)
        verify(operation !== null)

        operation.cubeA.xValue = 0
        operation.cubeA.yValue = 0
        operation.cubeA.zValue = 0

        operation.cubeB.xValue = 1.234
        operation.cubeB.yValue = 0
        operation.cubeB.zValue = 0

        tryCompare(operation, "distance", 1.2)
    }
}