//: [Previous](@previous)

import UIKit

protocol TestDelegate {
    func test()
}

class HomeVC: TestDelegate {
    func test() {
        print("test")
    }
}


class DetailVC {
    var delegate: TestDelegate?
    
    func delegateTest() {
        delegate = HomeVC()
        delegate?.test()
    }
}

let detail = DetailVC()

detail.delegateTest()

var arr = [1,4,5]

var dict = [1: "", 2: "aa"]

arr.description

var setTest: Set<Int> = [1,2,3]

for i in setTest {
    print(i)
}


class TestView: UIView {
    
    var testProperty: UInt32? = {
//        guard isHidden else { return nil }
        return arc4random()
    }()
}




let string = "http://www.tistory.com/%안녕?"
URL(string: string)
let encodedString = "https%3A%2F%2Fwww.test02-myrealtrip.com%2Finstants%2Faccommodations%2Fstays%2F109927%3Fplace%5Bplace_type%5D%3DGEO%26place%5Bplace_name%5D%3D%25EC%2584%259C%25EC%259A%25B8%26place%5Bgid%5D%3D109927%26place%5Blatitude%5D%3D37.4920530414%26place%5Blongitude%5D%3D127.0297346693%26checkin%3D2022-08-18%26checkout%3D2022-08-20%26adult_count%3D2%26curationType%3DALL"
let aaa = encodedString.removingPercentEncoding
let fsda = string.removingPercentEncoding ?? ""
URL(string: aaa ?? "")
