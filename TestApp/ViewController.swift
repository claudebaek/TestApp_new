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
            })
            .disposed(by: bag)
        
        NotificationCenter.default.rx.notification(UIDevice.orientationDidChangeNotification)
            .map { _ in UIDevice.current.orientation.isLandscape }
            .subscribe(onNext: { (test) in
//                print(test)
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
    
   
}

struct Student {
    
    var score: BehaviorSubject<Int>
}
