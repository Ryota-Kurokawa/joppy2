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
                Spacer()
                VStack {
                    Spacer()
                    HStack{
                        Text(userInfo.name)
                            .font(.custom("AvenirNext-Heavy", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.customBlackColor)
                            .padding(.trailing, 10)
                        Text(userInfo.userId)
                            .font(.custom("AvenirNext-Heavy", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.blue)

                    }
                    Spacer()
                    Text(userInfo.discription)
                        .font(.custom("AvenirNext-Heavy", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.customBlackColor)
                    Spacer()
                }
                .frame(width: 340, height: 300)
                .background(.white)
                .cornerRadius(15.0)
                Spacer()
                NavigationLink(destination: ProfileEditScreen()) {
                    Text("編集する")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 50)
                        .background(Color.customRedColor)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 1)
                        )
                }
                Spacer()
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
