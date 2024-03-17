//
//  MessageElement.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import Foundation
import FirebaseFirestoreSwift


struct EventElement: Codable {//jsonからswiftへ
    @DocumentID var id: String?
    var description: String
    var createAt: Date
    var title: String
}
