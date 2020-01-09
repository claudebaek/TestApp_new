//
//  ViewController.swift
//  TestApp
//
//  Created by 백두산(DooSan Baek) on 18/12/2018.
//  Copyright © 2018 백두산(DooSan Baek). All rights reserved.
//

import Photos
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button1.rx.tap
            .throttle(RxTimeInterval.seconds(2), scheduler: MainScheduler.instance)
            .subscribe(onNext: { (_) in
                print("throttle tap")
            })
        .disposed(by: bag)

        button2.rx.tap
            .debounce(RxTimeInterval.seconds(2), scheduler: MainScheduler.instance)
            .subscribe(onNext: { (_) in
                print("debounce tap")
            })
            .disposed(by: bag)
    
        NotificationCenter.default.rx.notification(UIDevice.orientationDidChangeNotification)
            .observeOn(MainScheduler.instance)
            .map { _ in UIDevice.current.orientation.isLandscape }
            .subscribe(onNext: { (test) in
                print(test)
            })
            .disposed(by: bag)
    }
}

