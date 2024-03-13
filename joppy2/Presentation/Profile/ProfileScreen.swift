//
//  ProfileScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/08.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
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
