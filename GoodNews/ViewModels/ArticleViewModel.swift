//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Rodolpho Maia on 04/03/22.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection() -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}
    
struct ArticleViewModel {
    private let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String {
        if let title = self.article.title {
            return title
        } else {
            return ""
        }
    }
    
    var description: String {
        if let description = self.article.description {
            return description
        } else {
            return ""
        }
    }
}

