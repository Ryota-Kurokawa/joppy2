//
//  LoginScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import SwiftUI

struct LoginScreen: View {
    @State var isPresented = false
    @State var isAlertShown = false
    @State var logInEmail = "Erika@gmail.com"
    @State var logInPassword = "Password1234"
    @FocusState var isFocused: Bool
    let controller = LoginController()
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBackgroundColor
                    .ignoresSafeArea()
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        // テキストフィールドからフォーカスを外す
                        isFocused = false
                    }
                VStack {
                    Spacer()
                        .frame(height: 100)
                    Text("Joppy")
                        .font(.custom("AvenirNext-Heavy", size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(Color.customBlackColor)
                    Spacer()
                        .frame(height: 100)
                    HStack {
                        Text("email")
                            .fontWeight(.semibold)
                            .font(.custom("Helvetica", size: 20))
                            .foregroundColor(Color.customBlackColor)
                        Spacer()
                    }.padding(.horizontal)
                    TextField("type your email", text: $logInEmail)
                        .focused($isFocused)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Spacer()
                        .frame(height: 80)
                    HStack {
                        Text("password")
                            .fontWeight(.semibold)
                            .font(.custom("Helvetica", size: 20))
                            .foregroundColor(Color.customBlackColor)
                        Spacer()
                    }.padding(.horizontal)
                    TextField("type your password", text: $logInPassword)
                        .focused($isFocused)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Spacer()
                        .frame(height: 120)
                    NavigationLink(
                        destination: SignUpScreen()
                    ) {
                        Text("新規登録")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .offset(x: 0, y: -35)
                    Button(action: {
                        Task {
                            if await controller.logIn(email: logInEmail, password: logInPassword) {
                                isPresented.toggle()
                            } else {
                                isAlertShown.toggle()
                            }
                        }
                    }) {
                        Text("Login")
                            .fontWeight(.semibold)
                            .font(.custom("Helvetica", size: 20))
                            .padding()
                            .foregroundColor(.white)
                    }
                    .frame(width: 100,height: 50)
                    .background(Color.customRedColor)
                    .cornerRadius(15.0)
                    .fullScreenCover(isPresented: $isPresented, content: {
                        HomeScreen()
                    })
                    .alert(isPresented: $isAlertShown) {
                        Alert(title: Text("Error"), message: Text("Failed to log in"), dismissButton: .default(Text("OK")))
                    }
                    .offset(x: 0, y: -30)
                    Spacer()
                }
            }

        }
    }
}

#Preview {
    LoginScreen()
}
