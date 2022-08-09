import UIKit

//private let concurrentQueue =
//    DispatchQueue(
//        label: "com.raywenderlich.GooglyPuff.photoQueue",
//        attributes: .concurrent)
//
//print("start")
//
//concurrentQueue.sync {
//    print(Thread.current)
//    for i in 0...100 {
//        print(i)
//    }
//}
//
//concurrentQueue.async {
//    print(Thread.current)
//    for i in 100...200 {
//        print(i)
//    }
//}
//
//print("end")
//
//

//
//
//
//



let queue = OperationQueue.init()
queue.maxConcurrentOperationCount = 1

queue.addOperation {
    
    globalA.sync {
        print(queueName())
        for i in 400...500 {
            print(i)
        }
    }
}

queue.addOperation {
    
    globalA.sync {
        print(queueName())
        for i in 500...600 {
            print(i)
        }
    }
}

