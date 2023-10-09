//
//  Article.swift
//  NewsList
//
//  Created by Naw Su Su Nyein on 09/10/2023.
//

import Foundation

struct ArticleList : Decodable {
    let articles : [Article]
}

struct Article : Decodable {
    let title : String
    let description : String
}
