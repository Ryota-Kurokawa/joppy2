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
        ZStack {
            Color.customBackgroundColor // ここを修正
                .ignoresSafeArea()
            VStack {
                Text("Coupon Detail")
                    .font(.custom("AvenirNext-Heavy", size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color.customBlackColor)
                Spacer()
                VStack {
                    Text("割引額: \(coupon.disscountRate)円")
                        .font(.custom("AvenirNext-Heavy", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.customBlackColor)
                        .padding()
                    Text("メッセージ: \(coupon.message)")
                        .font(.custom("AvenirNext-Heavy", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.customBlackColor)
                        .padding()
                }
                .frame(width: 350, height: 200)
                .background(.white)
                .cornerRadius(15)
                Spacer()
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
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica", size: 20))
                        .foregroundColor(.white)
                }
                .frame(width: 180,height: 70)
                .background(Color.customRedColor)
                .cornerRadius(15.0)
                .padding(.top, 30)
                Spacer()
            }

        }

    }
}

