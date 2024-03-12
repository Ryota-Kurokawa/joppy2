//
//  LoginScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 100)
                Text("Joppy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 500)
                NavigationLink{
                    HomeScreen()
                } label: {
                    Text("Login")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    LoginScreen()
}
