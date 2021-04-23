import UIKit

protocol TXMakable {
    func makeTX() -> String
}

class BTC : TXMakable {
    func makeTX() -> String {
        return "BTC TX"
    }
}

class ETH : TXMakable {
    func makeTX() -> String {
        return "ETH TX"
    }
}

enum CoinType {
    case BTC, ETH
}

enum TXFactory {
    static func select(for coinType:CoinType) -> TXMakable? {
        
        switch coinType {
        case .BTC :
            return BTC()
        case .ETH :
            return ETH()
        }
    }
}

TXFactory.select(for: .BTC)?.makeTX()







////////




protocol Decimal {
    func stringValue() -> String
    // factory
    static func make(string : String) -> Decimal
}

typealias NumberFactory = (String) -> Decimal

// Number implementations with factory methods

struct NextStepNumber: Decimal {
    private var nextStepNumber: NSNumber
    
    func stringValue() -> String { return nextStepNumber.stringValue }
    
    // factory
    static func make(string: String) -> Decimal {
        return NextStepNumber(nextStepNumber: NSNumber(value: (string as NSString).longLongValue))
    }
}

struct SwiftNumber : Decimal {
    private var swiftInt: Int
    
    func stringValue() -> String { return "\(swiftInt)" }
    
    // factory
    static func make(string: String) -> Decimal {
        return SwiftNumber(swiftInt:(string as NSString).integerValue)
    }
}
/*:
 Abstract factory
 */
enum NumberType {
    case nextStep, swift
}

enum NumberHelper {
    static func factory(for type: NumberType) -> NumberFactory {
        switch type {
        case .nextStep:
            return NextStepNumber.make
        case .swift:
            return SwiftNumber.make
        }
    }
}
/*:
 ### Usage
 */
let factoryOne = NumberHelper.factory(for: .nextStep)
let numberOne = factoryOne("1")
numberOne.stringValue()

let factoryTwo = NumberHelper.factory(for: .swift)
let numberTwo = factoryTwo("2")
numberTwo.stringValue()

print(numberTwo)


