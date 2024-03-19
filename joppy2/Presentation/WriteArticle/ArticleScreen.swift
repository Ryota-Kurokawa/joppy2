//
//  ArticleScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/19.
//

import SwiftUI

enum ArticleType {
    case write
    case read
}

struct ArticleScreen: View {
    @ScaledMetric(relativeTo: .body) var imageSize = CGFloat(2)
    @ScaledMetric(relativeTo: .body) var horizontalPadding: CGFloat = 4
    @ScaledMetric(relativeTo: .body) var verticalPadding: CGFloat = 2
    @ScaledMetric(relativeTo: .body) var cornerRadiusValue: CGFloat = 8
    @State var articleType: ArticleType = .read
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBackgroundColor
                    .ignoresSafeArea()
                VStack {
                    Text("Article")
                        .font(.custom("AvenirNext-Heavy", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color.customBlackColor)
                        .padding(.top,30)
                    Picker("TextFieldStyle", selection: $articleType) {
                        Text("Read").tag(ArticleType.read)
                        Text("Write").tag(ArticleType.write)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    VStack {
                        switch articleType {
                        case .read:
                            ReadOnlyScreen()
                        case .write:
                            WriteArticleScreen()
                        }
                    }
                    .animation(.easeInOut, value: articleType)
                    Spacer()
                }
            }
        }
    }
}
