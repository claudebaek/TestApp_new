//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    
    let subView = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
    
    let testVC = TestVC()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .yellow
                        
        button.backgroundColor = .white
        subView.backgroundColor = .white
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(touchTest), for: .touchUpInside)

        button.addSubview(subView)
        
        var shadows = UIView()
        shadows.frame = subView.bounds
//        shadows.clipsToBounds = false
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
        subView.addSubview(shadows)
        
        let testView = UIView(frame: subView.bounds)
        testView.backgroundColor = .brown
        subView.addSubview(testView)
        
        let testView1 = UIButton(frame: subView.bounds)
        testView1.backgroundColor = .red
        testView.addSubview(testView1)
        testView1.clipsToBounds = false
//        subView.applyDropShadow(withOffset: CGSize(width: 0, height: 8), opacity: 0.5, radius: 20, color: .black)
        
//        subView.layer.shadowColor = UIColor.black.withAlphaComponent(0.9).cgColor
//        subView.layer.shadowOpacity = 1
//        subView.layer.shadowRadius = 24
//        subView.layer.shadowOffset = CGSize(width: .zero, height: 8)
//        subView.layer.masksToBounds = false
        
  

        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.9).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 24
        layer0.shadowOffset = CGSize(width: 0, height: 8)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)
        
        let shadowPath1 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 8
        layer1.shadowOffset = CGSize(width: 0, height: 4)
        layer1.bounds = shadows.bounds
        layer1.position = shadows.center
        shadows.layer.addSublayer(layer1)
//        shadows.layer.masksToBounds = false
//        view.addSubview(label)
//        label.textColor = .blue
//        label.numberOfLines = 1
//        label.lineBreakStrategy = .hangulWordPriority
//        label.textAlignment = .left
//
//        label.text = "테스트ㅓ린ㅇ머라ㅣ.이것이바로"
//        label.lineBreakMode = .byTruncatingTail
        self.view = view
        
//        view.backgroundColor = .white
//        view.layer.compositingFilter = "multiplyBlendMode"

//        present(testVC, animated: true)
    }
    
    var i = 0
    
    @objc func touchTest(param: String = "#function") {
        
        i += 1
        print("param \(i)")
        
//        DispatchQueue.main.async {
//            self.imgView.image = UIImage(systemName: "square.and.arrow.up.fill")
//
////            DispatchQueue.main.async {
//                self.imgView.image = UIImage(systemName: "square.and.arrow.up")
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

extension UIView {
    func applyDropShadow(withOffset offset: CGSize,
                         opacity: Float,
                         radius: CGFloat,
                         color: UIColor) {
        layer.applyDropShadow(withOffset: offset,
                              opacity: opacity,
                              radius: radius,
                              color: color)
    }
    
    func removeDropShadow() {
        layer.removeDropShadow()
    }
}

extension CALayer {
    func applyDropShadow(withOffset offset: CGSize,
                         opacity: Float,
                         radius: CGFloat,
                         color: UIColor) {
        shadowOffset = offset
        shadowOpacity = opacity
        shadowRadius = radius
        shadowColor = color.cgColor
//        shouldRasterize = true
        rasterizationScale = UIScreen.main.scale
    }
    
    func removeDropShadow() {
        shadowOffset = .zero
        shadowOpacity = 0
        shadowRadius = 0
        shadowColor = UIColor.clear.cgColor
        shouldRasterize = false
    }
}
