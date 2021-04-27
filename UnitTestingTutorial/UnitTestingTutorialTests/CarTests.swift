//
//  CarTests.swift
//  UnitTestingTutorialTests
//
//  Created by JEONGSEOB HONG on 2021/04/27.
//

import XCTest
@testable import UnitTestingTutorial

class UnitTestingTutorialTests: XCTestCase {
    
    var ferrari: Car?
    var jeep: Car?
    var honda: Car?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        try super.setUpWithError()
        ferrari = Car(type: .Sport, transmissionMode: .Drive)
        jeep = Car(type: .OffRoad, transmissionMode: .Drive)
        honda = Car(type: .Economy, transmissionMode: .Park)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        ferrari = nil
        jeep = nil
        honda = nil
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        guard let ferrari = ferrari, let jeep = jeep else { return }
        let minutes = 60
        ferrari.start(minutes: minutes)
        jeep.start(minutes: minutes)
        XCTAssertTrue(ferrari.miles > jeep.miles)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
