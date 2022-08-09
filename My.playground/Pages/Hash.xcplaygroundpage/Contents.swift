//: [Previous](@previous)

import Foundation
import UIKit



struct TestModel {
    let keyName: String
}

let array = [TestModel(keyName: "a"), TestModel(keyName: "b")]

let dict = Dictionary(uniqueKeysWithValues: array.enumerated().map { ($1.keyName, $0) } )

print(dict["b"])


struct HashTestStruct: Hashable {
    var str: String = ""
}

struct HashA: Hashable {
    
    let id: Int
    let str: String
    let view: UIView?
    let test: HashTestStruct
//    static func == (lhs: HashA, rhs: HashA) -> Bool {
//        return lhs.hashValue == rhs.hashValue
//    }
    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }

}

//struct HashB: Hashable, Equatable {
//    let id = 1
//
//    static func == (lhs: HashB, rhs: HashB) -> Bool {
//        return lhs.hashValue == rhs.hashValue
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//}
let view = UIView(frame: .zero)
let t = HashTestStruct()
let a = HashA(id: 0, str: "a", view: view, test: HashTestStruct())
let b = HashA(id: 0, str: "a", view: view, test: HashTestStruct())

print(a.hashValue == b.hashValue)

class SuperClass {
    
}

class HashClass: SuperClass, Hashable {
    var test: String = ""
    
    static func == (lhs: HashClass, rhs: HashClass) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(test)
    }
}

let classA = HashClass()
//classA.test = "a"

let classB = HashClass()
//classB.test = "b"

print(classA == classB)

var testA = HashTestStruct()
testA.str = "a"
var testB = HashTestStruct()
testB.str = "a"

print(testA.hashValue )
print(testB.hashValue )

struct EquStrcut {
    let name: String
}

extension EquStrcut: Hashable {
    
}

let view1 = UIView(frame: .zero)
let view2 = UIView(frame: .zero)
let view3 = view2

print(view3 == view2)


let st1 = EquStrcut(name: "1")
let st2 = EquStrcut(name: "1")

print(st1 == st2)

let astr = "a"
print(astr.hashValue)

class Aclass: Hashable {
    static func == (lhs: Aclass, rhs: Aclass) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

let aa = Aclass(name: "a")
let aaa = Aclass(name: "a")

print(aa == aaa)


enum KeyEnum {
    case test
    case test2
}
struct AStruct: Hashable {
    
    let nameA: String
    let data: [KeyEnum: AnyHashable] = [KeyEnum.test: "efg", KeyEnum.test2: "fdsaaa"]
}

protocol ImpressionItem: UIView {
    
}

class TestView: UIView, ImpressionItem {
    
}

private var waitingImpressionItemsSet: Set<UIView>?

private var waitingImpressionItems = [ImpressionItem]()

class test<P: ImpressionItem> {
    var s : Set<P>?

    init() { }
}

let abc = test<TestView>()

