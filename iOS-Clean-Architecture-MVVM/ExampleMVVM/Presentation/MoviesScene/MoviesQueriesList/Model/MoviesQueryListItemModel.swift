//
//  MoviesQueryListItemViewModel.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 25.08.19.
//

import Foundation

class MoviesQueryListItemModel {
    let query: String

    init(query: String) {
        self.query = query
    }
}

extension MoviesQueryListItemModel: Equatable {
    static func == (lhs: MoviesQueryListItemModel, rhs: MoviesQueryListItemModel) -> Bool {
        return lhs.query == rhs.query
    }
}
