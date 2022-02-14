//
//  NumpadHStackView.swift
//  PG UIKit Calculator
//
//  Created by pavels.garklavs on 08/02/2022.
//

import UIKit

final class NumpadHStackView: UIStackView {

    private var resultLabel = UILabel()
    private var numpadViewModel = NumpadViewModel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        stackSetup()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        stackSetup()
    }

    private func stackSetup() {
        axis = .horizontal
        distribution = .fillEqually

        resultLabelSetup()
        numpadVStackSetup()
    }
}

private extension NumpadHStackView {
    func resultLabelSetup() {
        addSubview(resultLabel)

        resultLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.topMargin).offset(-20)
            make.right.equalTo(self).offset(-20)
        }

        resultLabel.text = "0"
        resultLabel.numberOfLines = 0
        resultLabel.preferredMaxLayoutWidth = bounds.width - 15
        resultLabel.lineBreakMode = .byWordWrapping
        resultLabel.sizeToFit()
        resultLabel.textColor = .white
        resultLabel.font = resultLabel.font.withSize(56)
    }

    func numpadVStackSetup() {
        for i in 0..<4 {
            let numpad = NumpadVStack(colIndex: i)
            numpad.stackSetup()
            numpad.numpadSetup()
            numpad.onButtonTap = { [weak self] symbol in
                guard let self = self else {
                    return
                }
                let result = self.numpadViewModel.getResult(clickedButton: symbol)
                self.resultLabel.text = "\(result)"
            }
            addArrangedSubview(numpad)
        }
    }
}
