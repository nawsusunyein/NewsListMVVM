//
//  NewListTableViewController.swift
//  NewsList
//
//  Created by Naw Su Su Nyein on 09/10/2023.
//

import Foundation
import UIKit

class NewListTableViewController : UITableViewController {
    
    private var articleListViewModel : ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-09-09&sortBy=publishedAt&apiKey=5d7d61dff0df47e08814f4ded3813b42")!
        Webservices().getArticles(url: url) {articles in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Article Tableview Cell is not found")
        }
        
        let articleVM = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
    
}
