//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .yellow

        let sv = UIView()
        sv.frame = CGRect(x: 10, y: 100, width: 200, height: 200)
        sv.backgroundColor = .red
        
//        sv.layer.masksToBounds = false
//        sv.layer.shadowPath = CGPath(rect: CGRect(x: 3, y: 3, width: sv.frame.width, height: sv.frame.height), transform: nil)
        sv.layer.backgroundColor = UIColor.white.cgColor
        sv.layer.shadowColor = UIColor.black.cgColor
        sv.layer.shadowOffset = CGSize(width: 3, height: 3)
        sv.layer.shadowRadius = 10
        sv.layer.shadowOpacity = 1
        sv.layer.shouldRasterize = true
        
        view.addSubview(sv)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


