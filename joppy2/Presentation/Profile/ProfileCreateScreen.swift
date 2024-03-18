//
//  ProfileCreateScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/15.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ProfileCreateScreen: View {
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
                Color.customBackgroundColor // ここを修正
                    .ignoresSafeArea()
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        // テキストフィールドからフォーカスを外す
                        isFocused = false
                    }
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                        .frame(height: 100)
                    Text("Joppy")
                        .font(.custom("AvenirNext-Heavy", size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(Color.customBlackColor)
                        .padding(.top,30)
                    Spacer()
                        .frame(height: 100)
                    HStack {
                        Text("name")
                            .font(.custom("AvenirNext-Heavy", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.customBlackColor)
                        Spacer()
                    }
                    .padding(.horizontal)
                        TextField("type your displayed", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .focused($isFocused)

                        .padding(.horizontal)
                    Spacer()
                        .frame(height: 80)
                    HStack {
                        Text("discription")
                            .font(.custom("AvenirNext-Heavy", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.customBlackColor)
                            .focused($isFocused)
                        Spacer()
                    }
                    .padding(.horizontal)
                    TextField("About You", text: $discription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .focused($isFocused)
                    Spacer()
                        .frame(height: 80)
                    HStack {
                        Text("user id like @joppy")
                            .font(.custom("AvenirNext-Heavy", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.customBlackColor)
                        Spacer()
                    }
                    .padding(.horizontal)
                    TextField("user id", text: $userId)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .focused($isFocused)
                    Spacer()
                        .frame(height: 80)
                    Button(action: {
                        Task {
                            if controller.updateProfile(userInfo: UserInfo(id: user.uid, name: name, userId: userId, discription: discription)) {
                                isCreateProfile.toggle()
                            } else {
                                isShowAlert.toggle()
                            }
                        }
                    }) {
                        Text("Create Profile")
                            .fontWeight(.semibold)
                            .font(.custom("Helvetica", size: 20))
                            .padding()
                            .foregroundColor(.white)
                    }
                    .frame(width: 210,height: 70)
                    .background(Color.customRedColor)
                    .cornerRadius(15.0)
                    .fullScreenCover(isPresented: $isCreateProfile) {
                        HomeScreen()
                    }
                    .alert(isPresented: $isShowAlert) {
                        Alert(title: Text("Error"), message: Text("Failed to create profile"), dismissButton: .default(Text("OK")))
                    }
                    Spacer()
                }
            }
        }.onAppear {
            Task {
                await controller.fetchUser()
                self.name = controller.userInfo.name
                self.discription = controller.userInfo.discription
            }
        }
    }
}
#Preview {
    ProfileCreateScreen()
}
