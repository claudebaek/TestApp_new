//: Playground - noun: a place where people can play

import UIKit

class Test {
    
    var closure: (() -> Void)?
    
    func excute() {
        
        var count = 0
        
        if closure == nil {
            closure = { count 
                count += 1
                print(count)
            }
        }
        self.closure!()
    }
    
}

let test = Test()

for _ in 0...5 {
    
    test.excute()
}

let testClosure = {
    print("test")
}


