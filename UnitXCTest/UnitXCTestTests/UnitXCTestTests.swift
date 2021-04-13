//
//  UnitXCTestTests.swift
//  UnitXCTestTests
//
//  Created by JEONGSEOB HONG on 2021/04/13.
//

import XCTest


class UnitXCTestTests: XCTestCase {

    func testAddStuff() {
        let math = MathStuff()
        let result = math.addNumbers(x: 1, y: 2)
        XCTAssertEqual(result, 3)
    }
    
    func testMultipleStuff() {
        let math = MathStuff()
        let result = math.multipleNumbers(x: 1, y: 2)
        XCTAssertEqual(result, 2)
    }
    
    func testDivideStuff() {
        let math = MathStuff()
        let result = math.divideNumbers(x: 10, y: 2)
        XCTAssertEqual(result, 3)
    }

}
