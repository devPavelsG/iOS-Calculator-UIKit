//
//  NumpadHStack.swift
//  PG UIKit Calculator
//
//  Created by pavels.garklavs on 08/02/2022.
//

import UIKit

final class ButtonsHStack: UIStackView {

    private var resultLabel = UILabel()
    private var calculatorViewModel = CalculatorViewModel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonHStackSetup()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        buttonHStackSetup()
    }

    private func buttonHStackSetup() {
        addSubview(resultLabel)

        axis = .horizontal
        distribution = .fillEqually

        resultLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.topMargin).offset(-20)
            make.right.equalTo(self).offset(-20)
        }

        resultLabel.text = "0"
        resultLabel.numberOfLines = 0
        resultLabel.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 15
        resultLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        resultLabel.sizeToFit()
        resultLabel.textColor = .white
        resultLabel.font = resultLabel.font.withSize(56)

        for i in 0..<4 {
            let numpad = NumpadVStack(colIndex: i)
            numpad.stackSetup()
            numpad.numpadSetup()
            numpad.onButtonTap = { [weak self] symbol in
                guard let self = self else {
                    return
                }
                let result = self.calculatorViewModel.getResult(clickedButton: symbol)
                self.resultLabel.text = "\(result)"
            }
            addArrangedSubview(numpad)
        }

    }

}
