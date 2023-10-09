//
//  Webservices.swift
//  NewsList
//
//  Created by Naw Su Su Nyein on 09/10/2023.
//

import Foundation

class Webservices {
    
    func getArticles(url : URL, completion : @escaping([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList  = articleList {
                    print(articleList.articles)
                    completion(articleList.articles)
                }
    
            }
        }.resume()
    }
}
