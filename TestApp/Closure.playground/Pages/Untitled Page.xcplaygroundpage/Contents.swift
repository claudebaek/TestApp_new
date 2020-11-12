import UIKit

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [unowned self] in
        
   
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    func printSome() {
        DispatchQueue.main.async {
            print(self.name)
        }
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"



var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
DispatchQueue.global().async {
    print(paragraph!.asHTML())
}

paragraph?.printSome()
paragraph = nil


class Test {
    
    var closure: (() -> Void)?
    
    func excute() {
        
        var count = 0
        
        if closure == nil {
            closure = {
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


