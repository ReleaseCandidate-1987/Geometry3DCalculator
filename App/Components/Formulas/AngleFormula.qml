import App.Style
import MathSymbols

/*!
    ...
*/
MathFunction {
    id: angleFormula
    name: "arccos"
    color: ColorPalette.foreground
    font.pointSize: 14
    MathFraction {
        MathVector {
            MathSubscript {
                MathText { text: "v" }
                subscript: MathText { text: "L" }
            }
        }
        
        MathText { text: "·" }
        
        MathVector {
            MathSubscript {
                MathText { text: "v" }
                subscript: MathText { text: "R" }
            }
        }
        
        denominator: MathRow {
            MathAbsolute {
                doubleBar: true
                
                MathVector {
                    MathSubscript {
                        MathText { text: "v" }
                        subscript: MathText { text: "L" }
                    }
                }
            }
            
            MathAbsolute {
                doubleBar: true
                
                MathVector {
                    MathSubscript {
                        MathText { text: "v" }
                        subscript: MathText { text: "R" }
                    }
                }
            }
        }
    }
}
