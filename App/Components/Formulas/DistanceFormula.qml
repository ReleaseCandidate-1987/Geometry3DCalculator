import App.Style
import MathSymbols

/*!
    DistanceFormula

    Stellt den Formelteil zur Berechnung des euklidischen Abstands zwischen
    zwei Punkten A und B im dreidimensionalen Raum dar.

    Formel:
        √((xB - xA)² + (yB - yA)² + (zB - zA)²)

    Die Berechnung basiert auf dem Satz des Pythagoras.
*/
MathRoot {
    id: distanceFormula
    color: ColorPalette.foreground
    /* Quadrierte Differenz der X-Koordinaten. */
    MathPower {
        MathParentheses {
            MathSubscript {
                MathText { text: "x" }
                subscript: MathText { text: "B" }
            }

            MathText { text: "−" }

            MathSubscript {
                MathText { text: "x" }
                subscript: MathText { text: "A" }
            }
        }

        exponent: MathText { text: "2" }
    }

    MathText { text: "+" }

    /* Quadrierte Differenz der Y-Koordinaten. */
    MathPower {
        MathParentheses {
            MathSubscript {
                MathText { text: "y" }
                subscript: MathText { text: "B" }
            }

            MathText { text: "−" }

            MathSubscript {
                MathText { text: "y" }
                subscript: MathText { text: "A" }
            }
        }

        exponent: MathText { text: "2" }
    }

    MathText { text: "+" }

    /* Quadrierte Differenz der Z-Koordinaten. */
    MathPower {
        MathParentheses {
            MathSubscript {
                MathText { text: "z" }
                subscript: MathText { text: "B" }
            }

            MathText { text: "−" }

            MathSubscript {
                MathText { text: "z" }
                subscript: MathText { text: "A" }
            }
        }

        exponent: MathText { text: "2" }
    }
}
