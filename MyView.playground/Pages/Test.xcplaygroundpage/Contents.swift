//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    let button = UIButton(frame: CGRect(x: 0, y: 200, width: 100, height: 100))
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 500))
    
    let testVC = TestVC()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .yellow
                
//        view.addSubview(imgView)
//        view.addSubview(button)
        view.addSubview(label)
        label.textColor = .blue
        label.numberOfLines = 1
        label.lineBreakStrategy = .hangulWordPriority
        label.textAlignment = .left
        
        label.text = "테스트ㅓ린ㅇ머라ㅣ.이것이바로"
        label.lineBreakMode = .byTruncatingTail
        self.view = view
        
//        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor.red.cgColor
//        view.layer.compositingFilter = "multiplyBlendMode"

//        present(testVC, animated: true)
    }
    
    var i = 0
    
    @objc func touchTest() {
        i += 1
        print("test \(i)")
        
//        DispatchQueue.main.async {
            self.imgView.image = UIImage(systemName: "square.and.arrow.up.fill")
            
//            DispatchQueue.main.async {
                self.imgView.image = UIImage(systemName: "square.and.arrow.up")
//            }
            
//        }
    }
}

class TestVC: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .black
        view.alpha = 0.5
    }
}



// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

