import UIKit
import RxSwift
import RxCocoa


let nums = [1,2,3,nil]
let nums1 = [10,20,30]

let numObs = Observable.from(nums)
let numObs1 = Observable.from(nums1)

let subject = PublishSubject<Int>.init()


let t = Observable.generate(initialState: 1, condition: { $0 < 10 }, iterate: { $0 + 1})

t.subscribe(onNext: {
    print($0)
})

let flat = numObs.flatMap { (a) -> Observable<String> in
    Observable.just("\(a)")
}

//let flatDriver = numObs.flatMap { (a) -> Driver<String> in
//    Driver.just("\(a)")
//}.asObservable().asDriver(onErrorJustReturn: "")

//flat.subscribe { (str) in
//    print("flat: \(str)")
//}

//flatDriver.drive(onNext: { (str) in
//    print("onNext: \(str)")
//
//}, onCompleted: {
//}, onDisposed: nil)



let ob = Observable<Int>.create { (ob) -> Disposable in
    ob.onNext(100)
    ob.onNext(101)
    ob.onCompleted()
    ob.onNext(102)
    return Disposables.create()
    }
    .share()
//    .asDriver(onErrorJustReturn: 0)


let text = PublishSubject<String>.init()
let page = PublishSubject<Int>.init()

let combine = Observable.zip(page, text)

combine.subscribe(onNext: { (page,text) in
//    print(page,text)
}, onError: nil, onCompleted: nil, onDisposed: nil)


text.onNext("test")
page.onNext(1)
page.onNext(2)
page.onNext(1)
text.onNext("test1")
text.onNext("test2")


let aaa = page.withLatestFrom(text)

aaa.subscribe(onNext: { (str) in
    print(str)
})

page.onNext(1)
text.onNext("test1")
page.onNext(1)
page.onNext(2)



struct Student {
    
  var score: BehaviorSubject<Int>
}


//let disposeBag = DisposeBag()

let ryan = Student(score: BehaviorSubject(value: 80))
let charlotte = Student(score: BehaviorSubject(value: 90))

let student = PublishSubject<Student>()

student
    .flatMap {
        $0.score
}
.subscribe(onNext: {
    print($0)
})
//    .disposed(by: disposeBag)

