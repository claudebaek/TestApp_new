//
//  LayoutTestView.swift
//  TestApp
//
//  Created by CLAUDE on 2020/02/05.
//  Copyright © 2020 백두산(DooSan Baek). All rights reserved.
//

import UIKit

class LayoutTestView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
     
     layoutSubviews call:
     
     1, Frame change will call

     2, AddSubview calls

     3, Rotating screen calls

     4, Roll a UIScrollView calls

     5, View changes in size, supreview will call
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)
        
        frame.size.width = 300
    }

}
