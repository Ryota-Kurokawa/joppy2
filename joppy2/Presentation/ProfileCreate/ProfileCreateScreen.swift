//
//  ProfileCreateScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/09.
//

import SwiftUI

struct ProfileCreateScreen: View {
    var body: some View {
        NavigationStack {
            Text("Profile Create Page!")
            NavigationLink {
                HomeScreen()
            } label: {
                Text("Create Profile")
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    ProfileCreateScreen()
}
