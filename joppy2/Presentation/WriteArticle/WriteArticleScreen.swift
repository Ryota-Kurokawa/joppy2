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
    @FocusState var isFocused: Bool
    let controller = ArticleController()
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
        ScrollView {
                VStack {
                    Text("Title")
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica", size: 20))
                        .foregroundColor(Color.customBlackColor)
                        .padding(.leading, -170)
                    TextField("Title", text: $title)
                        .focused($isFocused)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Text("Store Name")
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica", size: 20))
                        .foregroundColor(Color.customBlackColor)
                        .padding(.leading, -170)
                    TextField("禁断の扉", text: $storeName)
                        .focused($isFocused)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    VStack {
                        Text("Content")
                            .fontWeight(.semibold)
                            .font(.custom("Helvetica", size: 20))
                            .foregroundColor(Color.customBlackColor)
                            .padding(.leading, -170)
                        TextEditor(text: $articleText)
                            .focused($isFocused)
                            .frame(width: 360, height: 200)
                            .cornerRadius(10)
                        Text(changeMarkdownText(articleText))
                            .frame(width: 360, height: 100)
                            .background(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top,20)
                    ZStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                // ここに記事を投稿する処理を書く
                                Task {
                                    do {
                                        try await controller.storeArticle(title: title, storeName: storeName, content: articleText)
                                        isPresented.toggle()
                                    } catch {
                                        print("Couldn't parse: \(error)")
                                    }
                                }
                            }) {
                                Text("投稿する")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 50)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .fullScreenCover(isPresented: $isPresented) {
                                HomeScreen()
                            }
                            .frame(width: 100,height: 50)
                            .background(Color.customRedColor)
                            .cornerRadius(15.0)
                            Spacer()
                                .frame(width: 20)
                        }
                    }
                    Spacer()
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
