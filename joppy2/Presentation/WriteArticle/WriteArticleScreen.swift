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
    
    var body: some View {
        VStack {
            
            Text("Write Article")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(height: 100)
            Spacer()
                .frame(height: 100)
            Text("Title")
            TextField("Title", text: $title)
                .padding()
            Spacer()
            Text("Store Name")
            TextField("禁断の扉", text: $storeName)
                .padding()
            Spacer()
                .frame(height: 100)
            Text("Content")
            TextEditor(text: $articleText)
                .frame(height: 200)
                .cornerRadius(10)
                .border(Color.gray.opacity(0.5), width: 1)
                .padding()
            Spacer()
            ZStack {
                HStack {
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
                        .frame(width: 20)
                }
            }
        }
    }
}

#Preview {
    WriteArticleScreen()
}
