//
//  ProfileCreateScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/15.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ProfileEditScreen: View {
    private let user = Auth.auth().currentUser!
    @State private var name = ""
    @State private var discription = ""
    @State private var userId = ""
    @State private var isCreateProfile = false
    @State private var isShowAlert = false
    @FocusState var isFocused: Bool
    let db = Firestore.firestore()
    let controller = ProfileController()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBackgroundColor
                    .ignoresSafeArea()
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        // テキストフィールドからフォーカスを外す
                        isFocused = false
                    }
                Text("User Edit")
                    .font(.custom("AvenirNext-Heavy", size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color.customBlackColor)
                    .padding(.top,30)
                    .padding(.bottom, 10)
                    .offset(x: 0, y: -330)
                VStack {
                    VStack {
                        Text("name")
                            .fontWeight(.semibold)
                            .font(.custom("Helvetica", size: 20))
                            .foregroundColor(Color.customBlackColor)
                            .padding(.leading, -170)
                        TextField("type your displayed", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            .focused($isFocused)
                    }
                    Spacer()
                    VStack {
                        Text("discription")
                            .fontWeight(.semibold)
                            .font(.custom("Helvetica", size: 20))
                            .foregroundColor(Color.customBlackColor)
                            .padding(.leading, -180)
                        TextField("About You", text: $discription)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            .focused($isFocused)
                    }
                    Spacer()
                    Button(action: {
                        Task {
                            if controller.updateProfile(userInfo: UserInfo(id: user.uid, name: name, userId: userId, discription: discription)) {
                                isCreateProfile.toggle()
                            } else {
                                isShowAlert.toggle()
                            }
                        }
                    }) {
                        Text("Edit Profile")
                            .fontWeight(.semibold)
                            .font(.custom("Helvetica", size: 20))
                            .padding()
                            .foregroundColor(.white)
                    }
                    .frame(width: 160,height: 70)
                    .background(Color.customRedColor)
                    .cornerRadius(15.0)
                    .fullScreenCover(isPresented: $isCreateProfile) {
                        HomeScreen()
                    }
                    .alert(isPresented: $isShowAlert) {
                        Alert(title: Text("Error"), message: Text("Failed to create profile"), dismissButton: .default(Text("OK")))
                    }
                    Spacer()
                    Spacer()
                }
                .offset(x: 0, y: 130)
            }
        }.onAppear {
            Task {
                await controller.fetchUser()
                self.name = controller.userInfo.name
                self.discription = controller.userInfo.discription
                self.userId = controller.userInfo.userId
            }
        }
    }
}
#Preview {
    ProfileCreateScreen()
}
