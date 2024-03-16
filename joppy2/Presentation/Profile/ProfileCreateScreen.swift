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
    
    init() {
        let db = Firestore.firestore()
        let userInfo = UserInfo(id: user.uid, name: "name", havingCouponIds: [])
        do {
            try db.collection("users").document(user.uid).setData(from: userInfo)
        } catch {
            print("Error writing user to Firestore: \(error)")
        }
    }
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
                TextField("type your name", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                Spacer()
                    .frame(height: 80)
                HStack {
                    Text("email")
                    Spacer()
                }
                .padding(.horizontal)
                TextField("type your email", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                Spacer()
                    .frame(height: 80)
                HStack {
                    Text("password")
                    Spacer()
                }.padding(.horizontal)
                TextField("type your password", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                Spacer()
                    .frame(height: 120)
                Button(action:  {
                    Task {
//                        await ProfileController().updateProfile(id:user.uid,name:db.collection("userInfo"),havingCouponIds:[])
                    }
                }) {
                    Text("Create Profile")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
#Preview {
    ProfileCreateScreen()
}
