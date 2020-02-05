//
//  LayoutSubVIewController.swift
//  TestApp
//
//  Created by CLAUDE on 2020/02/05.
//  Copyright © 2020 백두산(DooSan Baek). All rights reserved.
//

import UIKit

class LayoutSubVIewController: UIViewController {

    @IBOutlet weak var testView: LayoutTestView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func tap(_ sender: Any) {
        testView.frame.size.width = 100
    }
    @IBAction func secondTap(_ sender: Any) {
        testView.frame.size.width = 200
    }
    
}
