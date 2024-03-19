//
//  ReadEllement.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/19.
//

import FirebaseFirestoreSwift


struct ArticleElement: Codable {//jsonからswiftへ
    @DocumentID var id: String?
    var title: String
    var content: String
    var storeName: String
}

