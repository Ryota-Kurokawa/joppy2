//
//  File.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import Foundation

struct UserInfo: Codable, Identifiable {
<<<<<<< HEAD
    var id: UUID = UUID()
    let name: String
    let havingCouponIds: [Coupon]
=======
    let id: String
    let name: String
    var havingCouponIds: [Coupon.ID]
>>>>>>> dev
}
