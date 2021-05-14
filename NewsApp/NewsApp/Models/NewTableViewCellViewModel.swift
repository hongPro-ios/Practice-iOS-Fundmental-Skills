//
//  NewTableViewCellViewModel.swift
//  NewsApp
//
//  Created by JEONGSEOB HONG on 2021/05/15.
//

import Foundation

class NewTableViewCellViewModel {
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(
        title: String,
        subtitle: String,
        imageURL: URL?) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        
    }
}
