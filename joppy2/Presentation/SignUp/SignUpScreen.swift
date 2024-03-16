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
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 100)
                    Text("Joppy")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                        .frame(height: 100)
                    HStack {
                        Text("email")
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
                        Spacer()
                    }.padding(.horizontal)
                    TextField("type your password", text: $signUpPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Spacer()
                        .frame(height: 120)
                    Button(action:  {
                        Task {
                            if await controller.signUp(email: signUpEmail,password: signUpPassword) {
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
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
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
            }
        }
    }
}

#Preview {
    SignUpScreen()
}
