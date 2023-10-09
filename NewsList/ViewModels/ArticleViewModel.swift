//
//  ArticleViewModel.swift
//  NewsList
//
//  Created by Naw Su Su Nyein on 09/10/2023.
//

import Foundation

struct ArticleListViewModel {
    var articles : [Article]
}

extension ArticleListViewModel {
    var numberOfSection : Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section : Int) -> Int {
        return articles.count
    }
    
    func articleAtIndex(_ index : Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article : Article
}

extension ArticleViewModel {
    init(_ article : Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title : String {
        return self.article.title
    }
    
    var description : String {
        return self.article.description
    }
}
