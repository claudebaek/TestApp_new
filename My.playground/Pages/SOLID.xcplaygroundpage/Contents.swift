

import Foundation

//MARK: DIP
protocol NoteBook {
    func 전원켜기()
    func 앱스토어(맥북: MyType)
    associatedtype MyType
}


class 맥북13인치: NoteBook {
    func 전원켜기() {}
    func 앱스토어(맥북: 맥북13인치) {
        print("앱스토어에 접근")
    }
}

class 맥북15인치: NoteBook {
    func 전원켜기() {}
    func 앱스토어(맥북: 맥북15인치) {
        print("앱스토어에 접근")
    }
}

let test: 맥북13인치 = 맥북13인치()
test.전원켜기()
print("test")
