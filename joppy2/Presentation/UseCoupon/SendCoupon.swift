//
//  SendCoupon.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/17.
//

import SwiftUI

struct SendCoupon: View {
    private let controller = CouponController()
    @State private var sendToUserId = "@"
    @State private var disscountRate: Int = 10
    @State private var message: String = ""
    @State private var isShowAlert = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Send Coupon")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
                .frame(height: 100)
            HStack {
                Text("Send To")
                Spacer()
            }
            .padding(.horizontal)
            TextField("@joppy", text: $sendToUserId)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Spacer()
                .frame(height: 80)
            HStack {
                Text("Disscount Rate(円)")
                Spacer()
            }
            .padding(.horizontal)
            TextField("100円", value: $disscountRate, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Spacer()
                .frame(height: 80)
            HStack {
                Text("Message")
                Spacer()
            }
            .padding(.horizontal)
            TextField("Message For Writer", text: $message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Spacer()
                .frame(height: 80)
            Button(action: {
                // Send Coupon
                Task {
                    do {
                        try await controller.sendCoupon(sendToUserId: sendToUserId, disscountRate: disscountRate, message: message)
                        dismiss()
                    } catch {
                        isShowAlert.toggle()
                    }
                }
            }) {
                Text("Send")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text("Failed to Send Coupon"))
            }
        }
    }
}

#Preview {
    SendCoupon()
}
