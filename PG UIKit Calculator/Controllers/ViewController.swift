//
//  ViewController.swift
//  PG UIKit Calculator
//
//  Created by pavels.garklavs on 08/02/2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var calculatorView = CalculatorViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calculatorView)
        calculatorViewSetup()
    }

    override open var shouldAutorotate: Bool {
        false
    }

    private func calculatorViewSetup() {
        calculatorView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

