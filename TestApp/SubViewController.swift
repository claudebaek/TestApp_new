//
//  SubViewController.swift
//  TestApp
//
//  Created by CLAUDE on 2019/12/03.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import UIKit

class SubViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var tapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapButton.setImage(UIImage(named: "btnMainplayerNext"), for: .normal)
//        tapButton.setBackgroundImage(UIImage(named: "btnMainplayerNext"), for: .normal)

        tapButton.setImage(UIImage(named: "btnMainplayerPlay"), for: .focused)
        tapButton.setImage(UIImage(named: "btnMainplayerPrevious"), for: .selected)
        tapButton.setImage(UIImage(named: "btnMainSetting"), for: .application)
//        tapButton.setImage(UIImage(named: "btnMainFavorite"), for: .highlighted)
//        tapButton.adjustsImageWhenHighlighted = false
    }

    @IBAction func tap(_ sender: Any) {
        view.bringSubviewToFront(greenView)
    }
    
    @IBAction func changeButton(_ sender: Any) {
//        tapButton.isSelected = !tapButton.isSelected
        tapButton.setImage(UIImage(named: "btnMainplayerPrevious"), for: .normal)
    }
    
}



/*
 
 - 버튼이 눌리면 하이라이트 상태로 바뀜
 - adjustsImageWhenHighlighted 는 눌릴때 기존 이미지의 색깔이 밝게 바뀔지 여부 결졍.
 - 하이라이트 이미지가 셋되어있으면 하이라이트 이미지로 바뀜
 - selected 에서도 눌리면 highlighted 상태로 전환
  
 */
