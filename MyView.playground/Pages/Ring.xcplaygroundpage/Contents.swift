//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import UICircularProgressRing



class MyViewController : UIViewController {
    
    lazy var progressRing = UICircularProgressRing(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
//        progressRing.backgroundColor = .white
        progressRing.outerRingColor = .red
        progressRing.innerRingColor = .red
//        progressRing.outerRingWidth = 8
        progressRing.innerRingWidth = 10
        progressRing.style = .dashed(pattern: [3])
        
        view.addSubview(progressRing)
        
        self.view = view
        
        self.progressRing.startProgress(to: 100, duration: 2)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
