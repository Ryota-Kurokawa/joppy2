//
//  MessageElement.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import Foundation
import FirebaseFirestoreSwift


struct MessageElement: Codable {//jsonからswiftへ
    @DocumentID var id: String?
    var message: String
    var createAt: Date
}
