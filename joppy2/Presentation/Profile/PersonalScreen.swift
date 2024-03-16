//
//  PersonalScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/16.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct PersonalScreen: View {
    private let user = Auth.auth().currentUser!
    private let controller = ProfileController()
    private let db = Firestore.firestore()
    @State private var userInfo: UserInfo = UserInfo(id: "", name: "", discription: "")
    
    var body: some View {
        VStack {
            Text("Personal")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(userInfo.name)
            Text(userInfo.discription)
            Button("test") {
                print(userInfo)
            }
        }
        .onAppear {
            Task {
                await controller.fetchUser()
                self.userInfo = controller.userInfo
            }
        }
    }
}
#Preview {
    PersonalScreen()
}
