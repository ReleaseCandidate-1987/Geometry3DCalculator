import App.Style
import MathSymbols

/*!
    ...
*/
MathRow {
    id: lengthFormula
    color: ColorPalette.foreground
    font.pointSize: 14
    MathSubscript {
        MathText {
            text: "L"
        }

        subscript: MathText {
            text: "0"
        }
    }

    MathText {
        text: "·"
    }

    MathText {
        text: "f"
    }
}
