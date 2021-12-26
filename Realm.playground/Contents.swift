//
//import RealmSwift
//
//class Dog: Object {
//    @objc dynamic var name = ""
//    @objc dynamic var age = 0
//}
//
//class Person: Object {
//    @objc dynamic var name = ""
//    @objc dynamic var picture: Data? = nil
//    let dogs = List<Dog>()
//}
//
//class realmDB: NSObject {
//    
//    @objc @discardableResult
//    static func add(text: String) -> Dog {
//            print(#function)
//            let realm: Realm = try! Realm()
//            let item = Dog.init()
//            item.name = text
//            
//            try! realm.write {
//                realm.add(item)
//            }
//            return item
//    }
//    
//    static func getObjects<T>(obj: T) -> Results<Dog> {
//        
//        let realm = try! Realm()
//        let dogs = realm.objects(Dog.self)
//        return dogs
//    }
//    
//    static func test() {
//        print("test before")
//        self.perform(#selector(realmDB.add), on: Thread(), with: nil, waitUntilDone: true)
//        print("test after")
//    }
//}
//
//realmDB.add(text: "fdsa")
//
//
//let realm = try! Realm()
//
//let dogs = realm.objects(Dog.self).filter("name == %@", "test")
//
//print(dogs)
//
