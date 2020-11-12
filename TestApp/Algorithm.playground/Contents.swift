//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


var imageArr: [Int] = [3,2,1]
var tempArr: [Int] = [Int]()
var isFoward = true

func repeatElements() {
    
    if tempArr.count == 1 {
        isFoward = true
    } else if imageArr.count == 0 {
        isFoward = false
    }
    
    if isFoward {
        tempArr.append(imageArr.removeLast())
    } else {
        imageArr.append(tempArr.removeLast())
    }
    if let last = tempArr.last {
        print(last)
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
           return repeatElements()
    }
}


//repeatElements()


