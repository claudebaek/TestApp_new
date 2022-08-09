
import UIKit

protocol SelfIdentifiable {
    
    static var reuseIdentifier: String { get }
}


extension SelfIdentifiable {
    
    static var reuseIdentifier: String {
        return String.init(describing: Self.self)
    }
    
}

var cellClass: UITableViewCell.Type {
    return TestCell.self
}

class TestCell: UITableViewCell, Testable {
    
}

protocol Testable: SelfIdentifiable, UITableViewCell {
}


print(cellClass is Testable.Type)

enum TestEnum {
    case test(at: Int)
}


func testFunc(param: TestEnum) {
    
}



struct SNSSignIn {
    private(set) var providerId: String
    
//    init(providerId: String) {
//        self.providerId = providerId
//    }
}

let aaa = SNSSignIn.init(providerId: "")

print("abc\n fdsa a")

