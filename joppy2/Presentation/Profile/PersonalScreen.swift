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
    @FocusState var isFocused: Bool
    @State var userInfo: UserInfo = UserInfo(id: "", name: "", userId: "", discription: "")
    
    var body: some View {
        ZStack {
            Color.customBackgroundColor
                .ignoresSafeArea()
            VStack {
                Text("Personal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(userInfo.name)
                    .font(.custom("AvenirNext-Heavy", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.customBlackColor)
                Text(userInfo.discription)
                    .font(.custom("AvenirNext-Heavy", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.customBlackColor)
                Text(userInfo.userId)
                    .font(.custom("AvenirNext-Heavy", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.customBlackColor)
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
