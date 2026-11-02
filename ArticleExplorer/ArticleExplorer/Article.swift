//
//  Article.swift
//  ArticleExplorer
//
//  Created by Zülal Nebin on 2.11.2026.
//

import Foundation

class Article {
    var title: String
    var shortDescription: String
    var description: String
    
    init(title: String, shortDescription: String, description: String) {
        self.title = title
        self.shortDescription = shortDescription
        self.description = description
    }
}
