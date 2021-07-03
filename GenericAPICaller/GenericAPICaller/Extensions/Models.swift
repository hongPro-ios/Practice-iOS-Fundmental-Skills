//
//  Models.swift
//  GenericAPICaller
//
//  Created by JEONGSEOB HONG on 2021/07/03.
//

import Foundation

// Models
struct User: Codable {
    let name: String
    let email: String
}

struct ToDoList: Codable {
    let title: String
    let completed: Bool
}
