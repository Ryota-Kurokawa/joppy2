//  ProfileScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/08.
//

import SwiftUI

struct SignUpScreen: View {
    @State var isPresented = false
    @State var isSignUpAlertShown = false
    @State var isSignInAlertShown = false
    @State var signUpEmail = ""
    @State var signUpPassword = ""
    let controller = AuthController()
    var body: some View {
        ZStack {
            Color.customBackgroundColor
                .ignoresSafeArea()
            NavigationStack {
                VStack {
                    Spacer()
                        .frame(height: 100)
                    Text("Joppy")
                        .font(.custom("AvenirNext-Heavy", size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                        .frame(height: 100)
                    HStack {
                        Text("email")
                            .font(.custom("AvenirNext-Heavy", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal)
                    TextField("type your email", text: $signUpEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Spacer()
                        .frame(height: 80)
                    HStack {
                        Text("password")
                            .font(.custom("AvenirNext-Heavy", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }.padding(.horizontal)
                    TextField("type your password", text: $signUpPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Spacer()
                        .frame(height: 120)
                    Button(action: {
                        Task {
                            if await controller.signUp(email: signUpEmail, password: signUpPassword) {
                                if await controller.signIn(email: signUpEmail, password: signUpPassword) {
                                    isPresented.toggle()
                                } else {
                                    isSignInAlertShown.toggle()
                                }
                            } else {
                                isSignUpAlertShown.toggle()
                            }
                        }
                    }) {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .font(.custom("Helvetica", size: 20))
                            .padding()
                            .foregroundColor(.white)
                    }
                    .frame(width: 100,height: 50)
                    .background(Color.white)
                    .cornerRadius(15.0)
                    .alert(isPresented: $isSignUpAlertShown) {
                        Alert(title: Text("Sign Up Failed"), message: Text("Please try again"), dismissButton: .default(Text("OK")))
                    }
                    .alert(isPresented: $isSignInAlertShown) {
                        Alert(title: Text("Sign In Failed"), message: Text("Please try again"), dismissButton: .default(Text("OK")))
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        ProfileCreateScreen()
                    }

                    Spacer()
                }
                .offset(x: 0, y: -60)
            }
        }
    }
}

#Preview {
    SignUpScreen()
}
