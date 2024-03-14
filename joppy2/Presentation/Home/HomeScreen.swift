//
//  SignupScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import SwiftUI
import CoreHaptics

enum TextFieldTypes {
    case Event
    case WriteBlog
    case UseCoupon
    case Profile
}

struct HomeScreen: View {
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
    @State var textFieldTypes: TextFieldTypes = .Event
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Joppy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.vertical, 40)
                Picker("TextFieldStyle", selection: $textFieldTypes) {
                    Text("Event").tag(TextFieldTypes.Event)
                    Text("Write Blog").tag(TextFieldTypes.WriteBlog)
                    Text("Use Coupon").tag(TextFieldTypes.UseCoupon)
                    Text("Profile").tag(TextFieldTypes.Profile)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                VStack {
                    switch textFieldTypes {
                    case .Event:
                        ScrollView {
                            VStack {
                                HStack {
                                    Text("email")
                                    Spacer()
                                }.padding(.horizontal)
                                TextField("type your email", text: $logInEmail)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                                Spacer()
                                    .frame(height: 80)
                                HStack {
                                    Text("password")
                                    Spacer()
                                }.padding(.horizontal)
                                TextField("type your password", text: $logInPassword)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                                Spacer()
                                    .frame(height: 80)
                                HStack {
                                    Text("email")
                                    Spacer()
                                }.padding(.horizontal)
                                TextField("type your email", text: $logInEmail)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                                Spacer()
                                    .frame(height: 80)
                                HStack {
                                    Text("password")
                                    Spacer()
                                }.padding(.horizontal)
                                TextField("type your password", text: $logInPassword)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                                Spacer()
                                    .frame(height: 80)
                                HStack {
                                    Text("email")
                                    Spacer()
                                }.padding(.horizontal)
                                TextField("type your email", text: $logInEmail)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                                Spacer()
                                    .frame(height: 80)
                                HStack {
                                    Text("password")
                                    Spacer()
                                }.padding(.horizontal)
                                TextField("type your password", text: $logInPassword)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                                Spacer()
                                    .frame(height: 80)
                            }
                        }
                    case .WriteBlog:
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
                    case .UseCoupon:
                        Text("UseCoupon")
                    case .Profile:
                        Text("Profile")
                    }
                }
                .animation(.easeInOut, value: textFieldTypes)
                Spacer()
                
            }
        }
    }
}

#Preview {
    HomeScreen()
}
