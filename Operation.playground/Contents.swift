import UIKit

let op = Operation.init()
let opq = OperationQueue.init()


class OP1: Operation {
    
    override func main() {
        print(Thread.current)
        for i in 0...100 {
            print(i)
        }
    }
    
    override func cancel() {
        super.cancel()
        
    }
}

class OP2: Operation {
    
    override func main() {
        print(Thread.current)
        for i in 200...3000 {
            print(i)
        }
    }
}

opq.maxConcurrentOperationCount = 1

let op1 = OP1.init()
let op2 = OP2.init()

op1.completionBlock = {
    print("op1 finished")
}

op2.completionBlock = {
    print("(op2.isCancelled) \(op2.isCancelled)")
    print("op2 finished")
}


//op1.addDependency(op2)
//op2.addDependency(op1)

opq.addOperation(op2)
//op2.cancel()

opq.cancelAllOperations()

opq.addOperation(op1)

opq.addOperation {
    print("done")
}
//opq.waitUntilAllOperationsAreFinished()

