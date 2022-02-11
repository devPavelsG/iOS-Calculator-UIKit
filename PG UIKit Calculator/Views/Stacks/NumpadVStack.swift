//
//  NumpadVStack.swift
//  PG UIKit Calculator
//
//  Created by pavels.garklavs on 08/02/2022.
//

import UIKit

final class NumpadVStack: UIStackView {

    var onButtonTap: ((String) -> Void)?
    private var colIndex: Int = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    required init(colIndex: Int) {
        super.init(frame: .zero)
        self.colIndex = colIndex
    }

    func stackSetup() {
        axis = .vertical
        distribution = .fillEqually
    }

    func numpadSetup() {
        for i in 1..<5 {
            let button = UIButton()
            button.backgroundColor = .lightGray
            button.layer.cornerRadius = 40
            button.clipsToBounds = true
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .highlighted)

            if (i < 4 && colIndex < 3) { // Digits
                let digit = (3 - i) * 3 + (colIndex + 1)
                button.setTitle(String(digit), for: .normal)
            } else if (colIndex == 3) {
                button.backgroundColor = .orange
                switch (i) {
                case 1: button.setTitle("*", for: .normal); break
                case 2: button.setTitle("/", for: .normal); break
                case 3: button.setTitle("+", for: .normal); break
                case 4: button.setTitle("-", for: .normal); break
                default: break
                }
            } else if (i == 4) {
                switch (colIndex) {
                case 0: symbolC(button: button); break
                case 1: button.setTitle("0", for: .normal); break
                case 2: symbolEquals(button: button); break
                default: break
                }
            }
            addArrangedSubview(button)
            button.addTarget(self, action: #selector(didTapButton(button:)), for: .touchUpInside)
        }
    }
}

private extension NumpadVStack {
    @objc func didTapButton(button: UIButton) {
        onButtonTap?(button.titleLabel?.text ?? "0")
    }

    func symbolC(button: UIButton) {
        button.setTitle("C", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .highlighted)
        button.setTitleColor(.orange, for: .highlighted)
    }

    func symbolEquals(button: UIButton) {
        button.setTitle("=", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.orange, for: .highlighted)
    }
}
