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
public func queueName() -> String {
    if let currentOperationQueue = OperationQueue.current {
        if let currentDispatchQueue = currentOperationQueue.underlyingQueue {
            return "dispatch queue: \(currentDispatchQueue.label ?? currentDispatchQueue.description)"
        }
        else {
            return "operation queue: \(currentOperationQueue.name ?? currentOperationQueue.description)"
        }
    }
    else {
        let currentThread = Thread.current
        return "UNKNOWN QUEUE on thread: \(currentThread.name ?? currentThread.description)"
    }
}
//
//
private let globalA = DispatchQueue(label: "A",attributes: .concurrent)
//
//
//private let globalB = DispatchQueue(label: "A",attributes: .concurrent)
//
//globalA.async {
//    print("globalA")
//    DispatchQueue.main.sync {
//        print(Thread.current)
//        print(queueName())
//
//        for i in 200...300 {
//            print(i)
//        }
//    }
//
//    globalB.sync {
//        print(Thread.current)
//        print(queueName())
//        for i in 300...400 {
//            print(i)
//        }
//    }
//}



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

