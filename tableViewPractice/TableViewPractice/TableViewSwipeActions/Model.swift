//
//  Model.swift
//  tableViewPractice
//
//  Created by JEONGSEOB HONG on 2021/05/02.
//

import Foundation

class User {
    var name: String
    var isFavorite: Bool
    var isMuted: Bool
    
    init(name: String,
         isFavorite: Bool,
         isMuted: Bool)
    {
        self.name = name
        self.isFavorite = isFavorite
        self.isMuted = isMuted
    }
}
