//: [Previous](@previous)

import Foundation


let serialQueue = DispatchQueue(label: "serial")
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .default, attributes: .concurrent)

concurrentQueue.async {
    print("start")
}

concurrentQueue.async {
    for i in 1...50 {
        print("first i: \(i)")
    }
}

concurrentQueue.sync {
    for i in 1...50 {
        print("second i: \(i)")
    }
}

print("end")











//DispatchQueue.main.sync {
//    print("test")
//}
























//private let globalA = DispatchQueue(label: "A",attributes: .concurrent)
//private let globalB = DispatchQueue(label: "A",attributes: .concurrent)
//
//public func queueName() -> String {
//    if let currentOperationQueue = OperationQueue.current {
//        if let currentDispatchQueue = currentOperationQueue.underlyingQueue {
//            return "dispatch queue: \(currentDispatchQueue.label ?? currentDispatchQueue.description)"
//        }
//        else {
//            return "operation queue: \(currentOperationQueue.name ?? currentOperationQueue.description)"
//        }
//    }
//    else {
//        let currentThread = Thread.current
//        return "UNKNOWN QUEUE on thread: \(currentThread.name ?? currentThread.description)"
//    }
//}
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
