//
//  ProfileController.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/15.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ProfileController {
    private let db = Firestore.firestore()
    @Published var userInfo: UserInfo = UserInfo(id: "", name: "", userId: "", discription: "")
    private let user = Auth.auth().currentUser!
    
    func updateProfile(userInfo: UserInfo) -> Bool {
        
        do {
            try db.collection("Users").document(user.uid).setData(from: userInfo)
            return true
        } catch {
            print("Error writing document: \(error)")
            return false
        }
    }
    
    func fetchUser() async {
        let docRef = db.collection("users").document(user.uid)
        
        do {
            let document = try await docRef.getDocument()
            if document.exists {
                let userData = document.data()
                let id = userData!["id"] as! String
                let name = userData!["name"] as! String
                let discription = userData!["discription"] as! String
                let userId = userData!["userId"] as! String
                
                userInfo = UserInfo(id: id, name: name, userId: userId, discription: discription)
            } else {
                print("Document does not exist")
            }
        } catch {
            print("Error fetching document: \(error)")
        }
    }
}

//
