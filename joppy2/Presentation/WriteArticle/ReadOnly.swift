//
//  ReadOnly.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/19.
//

import SwiftUI

struct ReadOnly: View {
    let title: String
    let storeName: String
    let content: String
    
    var body: some View {
        VStack {
            Text("Read Article")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
                .frame(height: 80)
            Text("Title")
            Text(title)
                .padding()
            Spacer()
                .frame(height: 40)
            Text("Store Name")
            Text(storeName)
                .padding()
            Spacer()
                .frame(height: 40)
            Text("Content")
            Text(changeMarkdownText(content))
                .frame(height: 120)
                .frame(width: 300)
                .border(Color.gray.opacity(0.5), width: 1)
                .padding()
                .background(Color.white)
            Spacer()
        }
    }
}


#Preview {
    ReadOnly(title: "Title", storeName: "Store Name", content: "~すごく楽しかった！~")
}
