//
// Created by pavels.garklavs on 09/02/2022.
//

import Foundation

final class NumpadViewModel {

    var returnResult = ""

    func getResult(clickedButton: String) -> String {

        if let firstChar = returnResult.first {
            if firstChar == "0" || returnResult == "inf" {
                returnResult = ""
            }
        }

        switch clickedButton {
        case "+", "-", "*", "/": operatorSymbols(button: clickedButton)
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9": returnResult += clickedButton
        case "=": returnResult = calculateResult().stringValue
        case "C": returnResult = "0"
        default: break
        }
        return returnResult
    }
}

private extension NumpadViewModel {
    func calculateResult() -> NSNumber {

        let predicate = NSPredicate(format: "1.0 * \(returnResult) = 0")

        guard let comparisation = predicate as? NSComparisonPredicate else {
            fatalError()
        }
        let leftExpression = comparisation.leftExpression
        guard let result = leftExpression.expressionValue(with: nil, context: nil) as? NSNumber else {
            return 0
        }
        return result
    }

    func operatorSymbols(button: String) {
        if let lastChar = returnResult.last {
            if checkLastSymbol(lastChar: lastChar) == false {
                return returnResult += button
            }
        }
    }

    func checkLastSymbol(lastChar: Character) -> Bool {
        let symbolArray: [Character] = ["+", "-", "*", "/"]

        for symbol in symbolArray {
            if symbol == lastChar {
                return true
            }
        }
        return false
    }

}
