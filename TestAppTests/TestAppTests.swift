//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by 백두산(DooSan Baek) on 18/12/2018.
//  Copyright © 2018 백두산(DooSan Baek). All rights reserved.
//

import XCTest
@testable import TestApp

import RxSwift

class TestAppTests: XCTestCase {

    func test1() {
        
        let images = [UIImage(), UIImage()]
        let nums = [1,2,3]
        let objs = Observable.of(1,2,3)
        let imgs = Observable.of(images)
        let imgFrom = Observable.from(images)

        let a = Observable.replayAll(objs)
        
        
        Observable.repeatElement(1)
            .subscribe(onNext: { (a) in
            print(a)
        })
        .disposed(by: DisposeBag() )
    }
    
    
    func test2() {
      
        let timer = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        
        timer.subscribe(onNext: { (a) in
            print(a)
        })
        .disposed(by: DisposeBag())
        
    }

}
