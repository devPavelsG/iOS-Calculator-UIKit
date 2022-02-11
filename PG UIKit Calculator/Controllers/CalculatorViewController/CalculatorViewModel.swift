//
// Created by pavels.garklavs on 09/02/2022.
//

import Foundation

class CalculatorViewModel {

    var returnResult = ""

    func getResult(clickedButton: String) -> String {

        if let firstChar = returnResult.first {
            if firstChar == "0" {
                returnResult = ""
            }
        }

        if returnResult == "inf" {
            returnResult = ""
        }

        switch clickedButton {
        case "+", "-", "*", "/", "=":
            if let lastChar = returnResult.last {
                if checkLastSymbol(lastChar: lastChar) == false {
                    if clickedButton == "+" {
                        returnResult.append("+")
                    } else if clickedButton == "-" {
                        returnResult.append("-")
                    } else if clickedButton == "*" {
                        returnResult.append("*")
                    } else if clickedButton == "/" {
                        returnResult.append("/")
                    } else if clickedButton == "=" {
                        returnResult = calculateResult().stringValue
                    }
                }
            }
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            if clickedButton == "0" {
                returnResult.append("0")
            } else if clickedButton == "1" {
                returnResult.append("1")
            } else if clickedButton == "2" {
                returnResult.append("2")
            } else if clickedButton == "3" {
                returnResult.append("3")
            } else if clickedButton == "4" {
                returnResult.append("4")
            } else if clickedButton == "5" {
                returnResult.append("5")
            } else if clickedButton == "6" {
                returnResult.append("6")
            } else if clickedButton == "7" {
                returnResult.append("7")
            } else if clickedButton == "8" {
                returnResult.append("8")
            } else if clickedButton == "9" {
                returnResult.append("9")
            }
        case "C": returnResult = "0"
        default:
            break
        }
        return returnResult
    }

    private func calculateResult() -> NSNumber {

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

    private func checkLastSymbol(lastChar: Character) -> Bool {
        let symbolArray: [Character] = ["+", "-", "*", "/"]

        for symbol in symbolArray {
            if symbol == lastChar {
                return true
            }
        }
        return false
    }
}
