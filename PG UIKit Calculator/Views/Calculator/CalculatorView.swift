//
//  MainViewController.swift
//  PG UIKit Calculator
//
//  Created by pavels.garklavs on 08/02/2022.
//

import UIKit
import SnapKit

final class CalculatorView: UIView {

    private var numpadHStack = NumpadHStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        numpadHStackViewSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        numpadHStackViewSetup()
    }

    private func numpadHStackViewSetup() {
        addSubview(numpadHStack)
        backgroundColor = .black

        numpadHStack.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(self.snp.centerY)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }

}
