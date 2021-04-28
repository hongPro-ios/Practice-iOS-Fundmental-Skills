//
//  StudentTests.swift
//  UnitTestingTutorialTests
//
//  Created by JEONGSEOB HONG on 2021/04/27.
//

import XCTest
@testable import UnitTestingTutorial

class StudentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGPAWithGrades() {
        let student = Student(name: "test", grades: [])
        XCTAssertNil(student.gpa)
    }
    
    func testGPAWithTenGrades() {
        let student = Student(name: "test", grades: Array(1...10).compactMap { Float($0) })
        XCTAssertEqual(student.gpa, 5.5)
    }

    func testGPAWithExtremeNumbers() {
        let student = Student(name: "test", grades: [Float(Int.min), Float(Int.max)])
        XCTAssertEqual(student.gpa, 0)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
