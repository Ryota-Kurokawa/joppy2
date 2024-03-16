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
    private let auth = Auth.auth()
    
    func updateProfile(id: String, name: String, havingCouponIds: [String]) {
        let userInfo = UserInfo(id: id, name: name, havingCouponIds: [])
        let user = auth.currentUser!
        do {
            try db.collection("users").document(user.uid).setData(from: userInfo)
        } catch {
            print("Error writing user to Firestore: \(error)")
        }
    }
    
    func fetchUser() {
        
        let user = auth.currentUser!
        
    }
}
