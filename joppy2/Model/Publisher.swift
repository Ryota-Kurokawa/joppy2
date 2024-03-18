//
//  Publisher.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import Foundation

struct Publisher: Codable, Identifiable {
    var id: UUID = UUID()
    let publisherName: String
    let member: [UserInfo]
}

