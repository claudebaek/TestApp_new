//
//  ViewController.swift
//  test
//
//  Created by 백두산(DooSan Baek) on 05/08/2019.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonTap(_ sender: Any) {
        print(textfield.text)
        
        
        if let text = textfield.text {
            
            if text == "b" {
                let vc = storyboard!.instantiateViewController(withIdentifier: "BTCDetailViewController") as! BTCDetailViewController
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if text == "l" {
                
                let vc = storyboard!.instantiateViewController(withIdentifier: "LTCDetailViewController") as! LTCDetailViewController
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        
    }
    

}

