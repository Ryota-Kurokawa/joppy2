//
//  LoginScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import SwiftUI

struct LoginScreen: View {
<<<<<<< HEAD
=======
    @State var isPresented = false
    @State var isAlertShown = false
    @State var logInEmail = ""
    @State var logInPassword = ""
    let controller = LoginController()
>>>>>>> dev
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 100)
                Text("Joppy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
<<<<<<< HEAD
                    .frame(height: 500)
                NavigationLink{
                    HomeScreen()
                } label: {
                    Text("Login")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
=======
                    .frame(height: 100)
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
                    .frame(height: 120)
                NavigationLink (
                    destination: SignUpScreen()
                ) {
                    Text("Make Your Account")
                }
                Button(action:  {
                    Task {
                        if await controller.logIn(email: logInEmail, password: logInPassword) {
                            isPresented.toggle()
                        } else {
                            isAlertShown.toggle()
                        }
                    }
                }) {
                    Text("Login")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.fullScreenCover(isPresented: $isPresented, content: {
                    HomeScreen()
                })
                .alert(isPresented: $isAlertShown) {
                    Alert(title: Text("Error"), message: Text("Failed to log in"), dismissButton: .default(Text("OK")))
>>>>>>> dev
                }
                Spacer()
            }
        }
    }
}

#Preview {
    LoginScreen()
}
