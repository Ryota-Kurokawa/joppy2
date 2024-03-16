//
//  Coupon.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import Foundation

struct Coupon: Codable, Identifiable {
    var id: UUID
    //    店のid
    let publishedBy: UUID
    let disscountRate: Int
    var isUsed: Bool
    
    init(id: UUID, publishedBy: UUID, disscountRate: Int, isUsed: Bool) {
        self.id = UUID()
        self.publishedBy = publishedBy
        self.disscountRate = disscountRate
        self.isUsed = false
    }
}
