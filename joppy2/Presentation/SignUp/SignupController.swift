//
//  SignupController.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/08.
//

import Foundation

class AuthController {
    let viewModel = AuthViewModel()
    // メールアドレスとパスワードを引数にして、新規登録するメソッドを呼び出す
    func signUp(email: String, password: String) async {
        do {
            try await viewModel.signUp(email: email, password: password)
        } catch {
            print("Error in signing up: \(error)")
        }
        
    }
    
    func signIn(email: String, password: String) async throws {
        do {
            try await viewModel.signIn(email: email, password: password)
        } catch {
            print("Error in signing in: \(error)")
        }
    }
}
