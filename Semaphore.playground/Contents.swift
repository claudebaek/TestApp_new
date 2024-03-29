import UIKit

var str = "Hello, playground"


let conqueue = DispatchQueue.init(label: "test", qos: DispatchQoS.default , attributes: DispatchQueue.Attributes.concurrent)

let sema = DispatchSemaphore.init(value: 0)
let semaphore = DispatchSemaphore.init(value: 1)

var test = 0

conqueue.async {
    
    for i in 0...100 {
        print(i)
    }
    
    test = 100
    sema.signal()
}

sema.wait()
//sema.wait()

print("res: \(test)")


//
DispatchQueue.global().async {
    print("Kid 1 - wait")
    semaphore.wait()
    print("Kid 1 - wait finished")
    sleep(1) // Kid 1 playing with iPad
    semaphore.signal()
    print("Kid 1 - done with iPad")
}
DispatchQueue.global().async {
    print("Kid 2 - wait")
    semaphore.wait()
    print("Kid 2 - wait finished")
    sleep(1) // Kid 1 playing with iPad
    semaphore.signal()
    print("Kid 2 - done with iPad")
}
DispatchQueue.global().async {
    print("Kid 3 - wait")
    semaphore.wait()
    print("Kid 3 - wait finished")
    sleep(1) // Kid 1 playing with iPad
    semaphore.signal()
    print("Kid 3 - done with iPad")
}

print("finish")

