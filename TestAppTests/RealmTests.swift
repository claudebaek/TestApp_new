//
//  RealmTests.swift
//  TestAppTests
//
//  Created by 백두산(DooSan Baek) on 12/04/2019.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import XCTest
import RealmSwift

class RealmTests: XCTestCase {
    
    var realm: Realm?
    
    func testRealm() {
        
        let myDog = Dog()
        let person = Person()
        myDog.name = "Rex"
        myDog.age = 1
        print("name of dog: \(myDog.name)")
        
        do {
            
            self.realm = try Realm()
            
            person.dogs.append(myDog)
            
            DispatchQueue.global().async {
                person.dogs.append(myDog)
                myDog.name = "aaa"

                try! self.realm?.write {
                    self.realm?.add(person)
                }
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
}


class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil
    let dogs = List<Dog>()
}


