import QtQuick
import QtQuick.Layouts

import "../../Controls"
import MathSymbols

/*!
    FormulaPreview

    Stellt die zur ausgewählten Rechenoperation gehörende mathematische
    Formel mithilfe der Komponenten aus MathSymbols dar.

    resultText:
        Enthält den einleitenden Teil der Formel, beispielsweise "d =".

    contentItems:
        Nimmt die weiteren MathSymbols-Komponenten auf, aus denen der
        eigentliche mathematische Ausdruck zusammengesetzt wird.
*/
MaterialContainer {
    id: formulaPreview
    title: "Formel"
    /* Einleitender Text vor dem mathematischen Ausdruck. */
    property string resultText: "d ="



    /* Ordnet den einleitenden Text und den Formelinhalt horizontal an. */
    MathRow {
        id: contentHost
        Layout.alignment: Qt.AlignHCenter
        color: ColorPalette.foreground
        font.pointSize: 14

        MathText {
            text: formulaPreview.resultText
        }
    }

}
