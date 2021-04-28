//
//  SchoolTests.swift
//  UnitTestingTutorialTests
//
//  Created by JEONGSEOB HONG on 2021/04/28.
//

import XCTest
@testable import UnitTestingTutorial

class SchoolTests: XCTestCase {
    
    // Mock students
    private let student1 = Student(name: "#1", grades: [2.0, 3.5, 4.0])
    private let student2 = Student(name: "#2", grades: [4.0, 4.0, 4.0])
    private let student3 = Student(name: "#3", grades: [1.0, 1.5])
    private let student4 = Student(name: "#4", grades: [])
    private let student5 = Student(name: "#5", grades: [4.0, 4.0, 4.0])

   
    // MARK: - topStudents (computed variable)
    
    // Scenario with no students at all
    func testTopStudentsWithNoStudents() {
        let school = School(students: [])
        XCTAssertTrue(school.topStudents.isEmpty)
        
    }
    
    // Scenario with two top students (#2 and #5)
    func testTopStudentsWithTwoTopStudents() {
        let school = School(students: [student1,
                                       student2,
                                       student3,
                                       student4,
                                       student5])
        let topStudents = school.topStudents
        XCTAssertFalse(topStudents.isEmpty)
        XCTAssertEqual(topStudents.count, 2)
        XCTAssertEqual(topStudents.first?.name, student2.name)
        XCTAssertEqual(topStudents.last?.name, student5.name)
        
    }
    
    // Scenario with one top student (#2)
    func testTopStudentsWithOneTopStudent() {
        let school = School(students: [student1, student2])
        let topStudents = school.topStudents
        XCTAssertFalse(topStudents.isEmpty)
        XCTAssertEqual(topStudents.count, 1)
        XCTAssertEqual(topStudents.first?.name, student2.name)
    }
    
    
    

}
