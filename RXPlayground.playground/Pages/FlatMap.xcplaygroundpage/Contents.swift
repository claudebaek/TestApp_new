//
//import RXSwift
//import RXCocoa
//import UIKit
//
//struct Student {
//    
//  var score: BehaviorSubject<Int>
//}
//
//
//let disposeBag = DisposeBag()
//
//// 1
//let ryan = Student(score: BehaviorSubject(value: 80))
//let charlotte = Student(score: BehaviorSubject(value: 90))
//
//// 2
//let student = PublishSubject<Student>()
//
//// 3
//student
//    .flatMap {
//        $0.score
//}
//.subscribe(onNext: {
//    print($0)
//})
//
//
