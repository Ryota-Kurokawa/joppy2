//
//  CouponScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/08.
//

import SwiftUI

struct UseCouponScreen: View {
    @State private var isPresented = false
    let controller = CouponController()
    @State private var receivedUser = UserInfo(id: "", name: "", userId: "", discription: "")
    @State private var couponList:[Coupon] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBackgroundColor // ここを修正
                    .ignoresSafeArea()
                VStack {
                    Text("Coupon")
                        .font(.custom("AvenirNext-Heavy", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color.customBlackColor)
                        .padding(.top,30)
                    List {
                        ForEach(couponList) { coupon in
                            NavigationLink(destination: DetailScreen(coupon: coupon)){
                                VStack {
                                    HStack {
                                        Text("Disscount Rate")
                                        Spacer()
                                        Text("\(coupon.disscountRate)円")
                                    }
                                    HStack {
                                        Text("Message")
                                        Spacer()
                                        Text(coupon.message)
                                    }
                                    Text(coupon.id.uuidString)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    ZStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                isPresented.toggle()
                            }) {
                                Text("クーポン発行")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 170, height: 90)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .frame(width: 100,height: 50)
                            .background(Color.customRedColor)
                            .cornerRadius(15.0)
                            .sheet(isPresented: $isPresented, content: {
                                SendCoupon()
                            })
                            Spacer()
                                .frame(width: 20)
                        }
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            Task {
                await controller.fetchUserId()
                receivedUser = controller.receivedUser
                do {
                    try await controller.fetchCoupon(userId: receivedUser.userId)
                    couponList = controller.couponList
                } catch {
                    print("error")
                }
            }
        }
    }
}

#Preview {
    UseCouponScreen()
}
