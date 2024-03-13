//
//  LoginController.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/08.
//

import Foundation

class LoginController {
    let viewModel = AuthViewModel()
    // メールアドレスとパスワードを引数にして、新規登録するメソッドを呼び出す
    func logIn(email: String, password: String) async {
        do {
            try await viewModel.signUp(email: email, password: password)
        } catch {
            print("Error in signing up: \(error)")
        }
    }
}
