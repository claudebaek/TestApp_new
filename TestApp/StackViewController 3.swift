//
//  StackViewController.swift
//  TestApp
//
//  Created by CLAUDE on 2019/11/28.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var redView: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        stackView.insertSubview(purpleView, at: 2)
//        stackView.removeArrangedSubview(blueView)
        stackView.insertArrangedSubview(yellowView, at: 3)
    }

}
