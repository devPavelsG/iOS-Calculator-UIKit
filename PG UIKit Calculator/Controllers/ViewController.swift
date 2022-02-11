//
//  ViewController.swift
//  PG UIKit Calculator
//
//  Created by pavels.garklavs on 08/02/2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        mainViewSetup()
    }

    override open var shouldAutorotate: Bool {
        false
    }
    
    private func mainViewSetup() {
        mainView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
              make.top.equalToSuperview()
              make.trailing.equalToSuperview()
              make.bottom.equalToSuperview()
        }
    }
}

