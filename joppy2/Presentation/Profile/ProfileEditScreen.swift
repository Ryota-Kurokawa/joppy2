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
    let db = Firestore.firestore()
    let controller = ProfileController()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 100)
                Text("Joppy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 100)
                HStack {
                    Text("name")
                    Spacer()
                }
                .padding(.horizontal)
                TextField("type your displayed", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                Spacer()
                    .frame(height: 80)
                HStack {
                    Text("discription")
                    Spacer()
                }
                .padding(.horizontal)
                TextField("About You", text: $discription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                Spacer()
                    .frame(height: 80)
                Button(action: {
                    Task {
                        if controller.updateProfile(userInfo: UserInfo(id: user.uid, name: name,userId: userId, discription: discription)) {
                            isCreateProfile.toggle()
                        } else {
                            isShowAlert.toggle()
                        }
                    }
                }) {
                    Text("Edit Profile")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $isCreateProfile) {
                    HomeScreen()
                }
                .alert(isPresented: $isShowAlert) {
                    Alert(title: Text("Error"), message: Text("Failed to create profile"), dismissButton: .default(Text("OK")))
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
