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
    @FocusState var isFocused: Bool

    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    // テキストフィールドからフォーカスを外す
                    isFocused = false
                }
            VStack {
                Text("Send Coupon")
                    .font(.custom("AvenirNext-Heavy", size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color.customBlackColor)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Spacer()
                    .frame(height: 100)
                    Text("Send To")
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica", size: 20))
                        .foregroundColor(Color.customBlackColor)
                        .padding(.leading, -170)
                .padding(.horizontal)
                TextField("@joppy", text: $sendToUserId)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .focused($isFocused)
                Spacer()
                    .frame(height: 80)
                    Text("Disscount Rate(円)")
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica", size: 20))
                        .foregroundColor(Color.customBlackColor)
                        .padding(.leading, -170)
                .padding(.horizontal)
                TextField("100円", value: $disscountRate, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .focused($isFocused)
                Spacer()
                    .frame(height: 80)
                    Text("Message")
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica", size: 20))
                        .foregroundColor(Color.customBlackColor)
                        .padding(.leading, -170)
                .padding(.horizontal)
                TextField("Message For Writer", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .focused($isFocused)
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
                    Text("投稿")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .frame(width: 100,height: 50)
                .background(Color.customRedColor)
                .cornerRadius(15.0)
                .alert(isPresented: $isShowAlert) {
                    Alert(title: Text("Failed to Send Coupon"))
                }
                Spacer()
            }
        }
    }
}

#Preview {
    SendCoupon()
}
