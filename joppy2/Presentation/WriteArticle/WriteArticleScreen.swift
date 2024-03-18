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
    @State private var articleText = "**Thank you!** Please visit our [website](https://example.com)"
    var body: some View {
        VStack {
            Text("Write Article")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
                .frame(height: 80)
            Text("Title")
            TextField("Title", text: $title)
                .padding()
            Spacer()
                .frame(height: 40)
            Text("Store Name")
            TextField("禁断の扉", text: $storeName)
                .padding()
            Spacer()
                .frame(height: 40)
            HStack {
                Spacer()
                    .frame(width: 20)
                Text("Content")
                Spacer()
            }
            TextEditor(text: $articleText)
                .frame(height: 100)
                .cornerRadius(10)
                .border(Color.gray.opacity(0.5), width: 1)
                .padding()
            Text(changeMarkdownText(articleText))
                .frame(height: 100)
                .frame(width: 360)
                .border(Color.gray.opacity(0.5), width: 1)
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

func changeMarkdownText(_ text: String) -> AttributedString {
    do {
        return try AttributedString(markdown:text)
    } catch {
        print("Couldn't parse: \(error)")
        return AttributedString(text)
    }
}


#Preview {
    WriteArticleScreen()
}
