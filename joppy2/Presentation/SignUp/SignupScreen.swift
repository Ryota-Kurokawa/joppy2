//
<<<<<<< HEAD
//  SignupScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import SwiftUI
import CoreHaptics

enum TextFieldTypes {
    case defaultStyle
    case customStyle
}

struct SignupScreen: View {
    @ObservedObject var viewModel = AuthViewModel()
    let authController = AuthController()
    @State var isSignedIn = false
    @State var logInEmail = "user@gmail.com"
    @State var logInPassword = "password"
    @State var signUpEmail = ""
    @State var signUpPassword = ""
    @ScaledMetric(relativeTo: .body) var imageSize = CGFloat(2)
    @ScaledMetric(relativeTo: .body) var horizontalPadding: CGFloat = 4
    @ScaledMetric(relativeTo: .body) var verticalPadding: CGFloat = 2
    @ScaledMetric(relativeTo: .body) var cornerRadiusValue: CGFloat = 8
    @State var textFieldTypes: TextFieldTypes = .defaultStyle
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Joppy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.vertical, 40)
                Picker("TextFieldStyle", selection: $textFieldTypes) {
                    Text("LogIn").tag(TextFieldTypes.defaultStyle)
                    Text("SignUp").tag(TextFieldTypes.customStyle)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                VStack {
                    switch textFieldTypes {
                    case .defaultStyle:
                        Spacer()
                            .frame(height: 80)
                        HStack {
                            Text("email")
                            Spacer()
                        }.padding(.horizontal)
                        TextField("type your account's email", text: $logInEmail)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        Spacer()
                            .frame(height: 80)
                        HStack {
                            Text("password")
                            Spacer()
                        }.padding(.horizontal)
                        TextField("type your account's password", text: $logInPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    case .customStyle:
                        Spacer()
                            .frame(height: 80)
                        HStack {
                            Text("email")
                            Spacer()
                        }.padding(.horizontal)
                        TextField("type new account's email", text: $signUpEmail)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        Spacer()
                            .frame(height: 80)
                        HStack {
                            Text("password")
                            Spacer()
                        }.padding(.horizontal)
                        TextField("type new account's password", text: $signUpPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        Spacer()
                            .frame(height: 80)
                        HStack {
                            Text("password (comfirm)")
                            Spacer()
                        }.padding(.horizontal)
                        TextField("comfirm new password", text: $signUpPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                }
                .animation(.easeInOut, value: textFieldTypes)
                Spacer()
                
                Button(textFieldTypes == .defaultStyle ? "Log In" : "Sign up") {
                    Task {
                        if textFieldTypes == .defaultStyle {
                            do {
                                try await authController.signIn(email: logInEmail, password: logInPassword)
                                isSignedIn = true
                            } catch {
                                print("error: \(error)")
                            }
                        }
                        if textFieldTypes == .customStyle {
                            do {
                                await authController.signUp(email: signUpEmail, password: signUpPassword)
                                do {
                                    try await authController.signIn(email: signUpEmail, password: signUpPassword)
                                    isSignedIn = true
                                }catch {
                                        print("error: \(error)")
                                }
                            }
                        }
                    }
                }
                .fullScreenCover(isPresented: $isSignedIn, content: {
                    HomeScreen()
                })
                .padding(.vertical, 20)
                .padding(.horizontal, 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                .frame(width: 200, height: 50)
                .animation(.easeInOut, value: textFieldTypes)
=======
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
                    HomeScreen()
                }
>>>>>>> dev
                Spacer()
            }
        }
    }
}

#Preview {
<<<<<<< HEAD
    SignupScreen()
=======
    SignUpScreen()
>>>>>>> dev
}
