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
    @State var userInfo: UserInfo = UserInfo(id: "", name: "", userId: "", discription: "")
    
    var body: some View {
        VStack {
            Text("Personal")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(userInfo.name)
            Text(userInfo.discription)
            Text(userInfo.userId)
            Spacer()
            HStack {
                Spacer()
                NavigationLink(destination: ProfileEditScreen()) {
                    Image(systemName: "pencil")
                        .frame(height: 60)
                        .frame(width: 60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .padding(.horizontal, 15)
                        .shadow(radius: 10)
                }
            }
        }
        .onAppear {
            Task {
                await controller.fetchUser()
                self.userInfo = controller.userInfo
            }
        }
        .background(Color.customBackgroundColor)
    }
}
#Preview {
    PersonalScreen()
}
