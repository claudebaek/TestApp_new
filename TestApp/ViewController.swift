//
//  ViewController.swift
//  TestApp
//
//  Created by 백두산(DooSan Baek) on 18/12/2018.
//  Copyright © 2018 백두산(DooSan Baek). All rights reserved.
//

import RxCocoa
import RxSwift

final class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let view = TestView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        view.backgroundColor = .yellow
        weakView = view
        print(weakView!)
        
        self.view.addSubview(weakView!)
        
//        weakView?.removeFromSuperview()
    }
    
    var testArray = [Int]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // addSubview 로 레퍼런스 카운트가 증가하여 인스턴스를 유지한다.
        print(weakView)
        weakView?.removeFromSuperview()
        print(weakView)
        
        FloOperationQueue.serialQueue.maxConcurrentOperationCount = 1
    }
    
    @IBAction func btn1Tap(_ sender: Any) {
//        OperationQueue.main.addOperation(top)
        
        for _ in 0...1000 {
            let top = ToastOperation()
            
            FloOperationQueue.serialQueue.addOperation(top)
        }
    }
    
    @IBAction func btn2Tap(_ sender: Any) {
        FloOperationQueue.serialQueue.cancelAllOperations()

        let aop = AlertOperation()
//        OperationQueue.main.addOperation(aop)
        FloOperationQueue.serialQueue.addOperation(aop)
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



enum FloOperationQueue {
    
    static let serialQueue = OperationQueue()
}

class AlertOperation: Operation {
    
    override func main() {
        super.main()
        print("AlertOperation")
    }
}

class ToastOperation: Operation {
    
    override func main() {
        super.main()
        sleep(1)
        print("ToastOperation")
    }
    
    override func start() {
        super.start()
        print("start")
    }
    
    override func cancel() {
        super.cancel()
        print("cancel")
    }
    
}
