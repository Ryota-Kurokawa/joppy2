//
//  ProfileScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/08.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("profile")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.bottom, 50)
                Text("Ryota Kurokawa")
                    .font(.title)
                    .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    ProfileScreen()
}
