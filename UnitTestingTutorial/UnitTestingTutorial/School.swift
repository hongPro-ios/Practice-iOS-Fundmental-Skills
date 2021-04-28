//
//  School.swift
//  UnitTestingTutorial
//
//  Created by JEONGSEOB HONG on 2021/04/27.
//

import Foundation

struct Student {
    let name: String
    let grades: [Float]
    var gpa: Float? {
        guard !grades.isEmpty else { return nil }
        return grades.reduce(0, +) / Float(grades.count)
    }
}

struct School {
    let students: [Student]
    var topStudents: [Student] { students(withGPALimit: 4.0)}
}


private extension School {
    func students(withGPALimit gpa: Float) -> [Student] {
        students.filter {
            guard let studentGPA = $0.gpa else { return false }
            return studentGPA >= gpa
        }
    }
}
