//
//  Article.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/17.
//

import Foundation

struct Article: Identifiable {
    let id: UUID
    let title: String
    let body: String
    let publishedBy: String
    let publishedAt: Date
}
