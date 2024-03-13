//
//  AuthViewModel.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/08.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject, AuthProtocol {
    @Published var isAuthenticated = false
    
    // イニシャライザメソッドを呼び出して、アプリの起動時に認証状態をチェックする
    init() {
        observeAuthChanges()
    }
    
    private func observeAuthChanges() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.isAuthenticated = user != nil
        }
    }
    
    // ログインするメソッド
    func signIn(email: String, password: String) async throws {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            isAuthenticated = true
        }
    }
    
    // 新規登録するメソッド
    func signUp(email: String, password: String) async throws {
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
            isAuthenticated = true
        }
    }
    
    // パスワードをリセットするメソッド
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Error in sending password reset: \(error)")
            }
        }
    }
    
    // ログアウトするメソッド
    func signOut() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
