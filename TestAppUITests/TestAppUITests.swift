//
//  TestAppUITests.swift
//  TestAppUITests
//
//  Created by 백두산(DooSan Baek) on 18/12/2018.
//  Copyright © 2018 백두산(DooSan Baek). All rights reserved.
//

import XCTest
//@testable import TestApp

class TestAppUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()

        app.launchArguments.append("uitesting")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        

        let buttonElement = XCUIApplication().scrollViews.otherElements.containing(.button, identifier:"Button").element
//        buttonElement.swipeUp()
        buttonElement.swipeDown()
        buttonElement.swipeUp()
        buttonElement.swipeDown()
        
//        app.swipeLeft()
//        app.swipeRight()
//        app.swipeDown()
    }
    
    func testMulti() {
        
            
        
    }


}
