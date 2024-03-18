//
//  CouponController.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/17.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class CouponController {
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser!
    @Published var receivedUser = UserInfo(id: "", name: "", userId: "", discription: "")
    @Published var couopon = Coupon(id: UUID(), publishedBy: "", disscountRate: 0, message: "", isUsed: false)
    @Published var couponList: [Coupon] = []
    
    
    func sendCoupon(sendToUserId: String, disscountRate: Int, message: String) async throws {
        let docRef = db.collection("Coupon").document(sendToUserId).collection("received").document()
        
        let coupon = Coupon(id: UUID(), publishedBy: user.uid, disscountRate: disscountRate, message: message, isUsed: false)
        
        do {
            try docRef.setData(from: coupon)
        }
    }
    
    func fetchCoupon(userId: String) async throws {
        let  docRef = db.collection("Coupon").document(userId).collection("received")

//
//        listとしてfetchできていないのでdocumentをlistに入れて取得し、それを出力させる。
//        
        do {
            let couponSnapshot = try await docRef.getDocuments()
            for document in couponSnapshot.documents {
                let couponData = document.data()
                _ = couponData["id"] as! String
                let publishedBy = couponData["publishedBy"] as! String
                let disscountRate = couponData["disscountRate"] as! Int
                let message = couponData["message"] as! String
                let isUsed = couponData["isUsed"] as! Bool
                
                couopon = Coupon(id: UUID(), publishedBy: publishedBy, disscountRate: disscountRate, message: message, isUsed: isUsed)
                couponList.append(couopon)
                print(couponList)
            }
        }
        
//        do {
//            let document = try await docRef.getDocument()
//            if document.exists {
//                let couponData = document.data()
//                let id = couponData!["id"] as! String
//                let publishedBy = couponData!["publishedBy"] as! String
//                let disscountRate = couponData!["disscountRate"] as! Int
//                let message = couponData!["message"] as! String
//                let isUsed = couponData!["isUsed"] as! Bool
//                
//                couopon = Coupon(id: UUID(), publishedBy: publishedBy, disscountRate: disscountRate, message: message, isUsed: isUsed)
//            } else {
//                print("Document does not exist")
//            }
//        }
    }
    
    func fetchUserId() async {
        let docRef = db.collection("Users").document(user.uid)
        
        do {
            let document = try await docRef.getDocument()
            if document.exists {
                let userData = document.data()
                let id = userData!["id"] as! String
                let name = userData!["name"] as! String
                let discription = userData!["discription"] as! String
                let userId = userData!["userId"] as! String
                
                receivedUser = UserInfo(id: id, name: name, userId: userId, discription: discription)
            } else {
                print("Document does not exist")
            }
        } catch {
            print("Error fetching document: \(error)")
        }
    }
    
}
