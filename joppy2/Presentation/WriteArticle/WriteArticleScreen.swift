//
//  PointMakeScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/08.
//

import SwiftUI

struct WriteArticleScreen: View {
    @State private var isPresented = false
    @State private var title = ""
    @State private var storeName = ""
    @State private var articleText = "すごく楽しかった！"
    @FocusState var isFocused: Bool

    var body: some View {
        ZStack {
            Color.customBackgroundColor
                .ignoresSafeArea()
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    // テキストフィールドからフォーカスを外す
                    isFocused = false
                }
            VStack {
                Spacer()
                Text("Write Article")
                    .font(.custom("AvenirNext-Heavy", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.customBlackColor)
                Spacer()
                Text("Title")
                    .fontWeight(.semibold)
                    .font(.custom("Helvetica", size: 20))
                    .foregroundColor(Color.customBlackColor)
                    .padding(.leading, -160)
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .focused($isFocused)
                Spacer()
                Text("Store Name")
                    .fontWeight(.semibold)
                    .font(.custom("Helvetica", size: 20))
                    .foregroundColor(Color.customBlackColor)
                    .padding(.leading, -160)
                TextField("禁断の扉", text: $storeName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .focused($isFocused)
                Spacer()
                VStack {
                    Text("Content")
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica", size: 20))
                        .foregroundColor(Color.customBlackColor)
                        .padding(.leading, -160)
                    TextEditor(text: $articleText)
                        .focused($isFocused)
                        .frame(width: 360, height: 200)
                        .cornerRadius(10)
                        .border(Color.gray.opacity(0.5), width: 1)
                }
                Spacer()
                Button(action: {
                    // ここに記事を投稿する処理を書く
                }) {
                    Image(systemName: "paperplane")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}


#Preview {
    WriteArticleScreen()
}
