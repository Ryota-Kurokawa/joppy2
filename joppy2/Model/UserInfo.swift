//
//  File.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import Foundation

struct UserInfo: Codable, Identifiable {
    var id: UUID = UUID()
    let name: String
    let havingCouponIds: [Coupon]
}
