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
    @State private var coupon:[Coupon] = []
    
    var body: some View {
        ZStack {
            Color.customBackgroundColor // ここを修正
                .ignoresSafeArea()
            VStack {
                Text("Coupon")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                List {
                    ForEach(coupon) { coupon in
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
                        }
                    }
                }
                ZStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isPresented.toggle()
                        }) {
                            Image(systemName: "paperplane")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .sheet(isPresented: $isPresented, content: {
                            SendCoupon()
                        })
                        Spacer()
                            .frame(width: 20)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await controller.fetchUserId()
                self.receivedUser = controller.receivedUser
                do {
                    try await controller.fetchCoupon(userId: receivedUser.userId)
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
