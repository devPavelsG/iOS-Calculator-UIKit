//
//  MainViewController.swift
//  PG UIKit Calculator
//
//  Created by pavels.garklavs on 08/02/2022.
//

import UIKit
import SnapKit

final class CalculatorViewController: UIView {

    private var buttonsHStack = ButtonsHStack()

    override init(frame: CGRect) {
        super.init(frame: frame)
        CalcViewSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        CalcViewSetup()
    }

    private func CalcViewSetup() {
        addSubview(buttonsHStack)
        backgroundColor = .black

        buttonsHStack.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(self.snp.centerY)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }

}
