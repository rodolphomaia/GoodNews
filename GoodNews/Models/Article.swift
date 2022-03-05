//
//  Articles.swift
//  GoodNews
//
//  Created by Rodolpho Maia on 04/03/22.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
