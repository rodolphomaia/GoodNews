//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Rodolpho Maia on 04/03/22.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController{
    
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=br&apiKey=YOUR_API_KEY")!
        
        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        
        return cell
    }
}
