//
//  AuthProtocol.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/08.
//

import Foundation

protocol AuthProtocol {
    func signIn(email: String, password: String) async throws
    func signUp(email: String, password: String) async throws
    func resetPassword(email: String)
    func signOut()
}
