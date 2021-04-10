//
//  APICaller.swift
//  TableViewPagenation
//
//  Created by JEONGSEOB HONG on 2021/04/10.
//

import Foundation

class APICaller {
    var isPaginating = false
    
    func fetchData(pagination: Bool = false, completion: @escaping (Result<[String], Error>) -> Void) {
        if pagination {
            isPaginating = true
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2)) {
            let originalData = [
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook"
            ]
            
            let newData = [
                "banana",
                "oranges",
                "grapes",
                "Food"
            ]
            completion(.success( pagination ? newData : originalData))
        }
    }
}
