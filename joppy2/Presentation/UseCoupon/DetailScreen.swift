//
//  DetailScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/18.
//

import SwiftUI

struct DetailScreen: View {
    let coupon: Coupon
    private let controller = CouponController()
    @State var isShownAlert:Bool = false
    
    var body: some View {
        Text("Coupon Detail")
            .font(.largeTitle)
            .fontWeight(.bold)
        Text("Disscount Rate: \(coupon.disscountRate)円")
        Text("Message: \(coupon.message)")
        Text(coupon.id.uuidString)
        Button(action: {
            Task {
                do {
                    try await controller.useCoupon(couponId: coupon.id.uuidString)
                } catch {
                    isShownAlert.toggle()
                }
            }
        }) {
            Text("Use Coupon")
        }
        
    }
}

