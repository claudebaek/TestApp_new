//
//  ViewController.swift
//  TestApp
//
//  Created by 백두산(DooSan Baek) on 18/12/2018.
//  Copyright © 2018 백두산(DooSan Baek). All rights reserved.
//

import RxCocoa
import RxSwift
import SnapKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var horiStackView: UIStackView!
    @IBOutlet weak var myTextView: UITextView!
    
    weak var weakView: TestView?
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ryan = Student(score: BehaviorSubject(value: 80))
        let charlotte = Student(score: BehaviorSubject(value: 90))
        
        let student = PublishSubject<Student>()
        
        button1.rx.tap
            .throttle(RxTimeInterval.seconds(2), scheduler: MainScheduler.instance)
            .subscribe(onNext: { (_) in
                print("throttle tap")
                student.onNext(ryan)
                student.onNext(charlotte)
                
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScrollViewController") as! ScrollViewController
                self.parent?.present(vc, animated: true)
            })
            .disposed(by: bag)
        
        button2.rx.tap
            .debounce(RxTimeInterval.seconds(2), scheduler: MainScheduler.instance)
            .subscribe(onNext: { (_) in
                print("debounce tap")
                ryan.score.onNext(85)
                ryan.score.onNext(95)
                charlotte.score.onNext(100)
                charlotte.score.onNext(110)
            })
            .disposed(by: bag)
        
        NotificationCenter.default.rx.notification(UIDevice.orientationDidChangeNotification)
            .map { _ in UIDevice.current.orientation.isLandscape }
            .subscribe(onNext: { (test) in
                print(test)
            })
            .disposed(by: bag)
        
        student
            .flatMap {
                $0.score
        }
        .subscribe(onNext: {
            print($0)
        })
            .disposed(by: bag)
        
        let button1 = UIButton()
        button1.setTitle("test", for: .normal)
        button1.backgroundColor = .yellow
        
        let button2 = UIButton()
        button2.setTitle("testtest", for: .normal)
        button2.backgroundColor = .yellow

        let button3 = UIButton()
        button3.setTitle("testtesttestfdjklsajflksa", for: .normal)
        button3.backgroundColor = .yellow
        
        horiStackView.addArrangedSubview(button1)
        horiStackView.addArrangedSubview(button2)
        horiStackView.addArrangedSubview(button3)
        
//        button1.snp.makeConstraints {
//            $0.width.equalTo(20)
//        }
//        button2.snp.makeConstraints {
//            $0.width.equalTo(20)
//        }
//        button3.snp.makeConstraints {
//            $0.width.equalTo(20)
//        }
        
        myTextView.textContainer.maximumNumberOfLines = 3
    }
    
    let testView = TestView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        testView.backgroundColor = .yellow
        weakView = testView
        print(weakView!)
        
        self.view.addSubview(weakView!)
//        weakView?.removeFromSuperview()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // addSubview 로 레퍼런스 카운트가 증가하여 인스턴스를 유지한다.
        print(weakView)
        weakView?.removeFromSuperview()
        print(weakView)
    }
   
}

struct Student {
    
    var score: BehaviorSubject<Int>
}

class TestView: UIView {
    
    let subView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.addSubview(subView)

    }
    deinit {
        print(#function)
    }
}
