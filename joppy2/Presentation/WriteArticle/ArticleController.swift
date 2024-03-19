//
//  Article.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/19.
//

import Foundation
import FirebaseFirestore



class ArticleController {
    
    func storeArticle(title:String, storeName:String, content:String) {
        let article = Article(title: title, storeName: storeName, content: content)
        let db = Firestore.firestore()
        do {
            try db.collection("Article").addDocument(from: article) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
