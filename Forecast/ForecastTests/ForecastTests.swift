//
//  ForecastTests.swift
//  ForecastTests
//
//  Created by 백두산(DooSan Baek) on 05/08/2019.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import XCTest
@testable import Forecast

class ForecastTests: XCTestCase {
    
    let net = Network()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {

        let exp = expectation(description: "parse")
        let ser = ForecastService(network: net)
        
        var response: DarkSkyResponse?
        
        ser.weatherSearch(latitude: "42.3601", longitude: "-71.0589") { (res) in
            print(res)
            response = res
            exp.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssertNotNil(response)
    }

}
