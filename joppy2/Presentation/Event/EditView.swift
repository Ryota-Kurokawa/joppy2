//
//  EditView.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import SwiftUI


struct EditView: View {
    @Binding var isShowSheet: Bool
    var messageVM = MessageViewModel()
    @State var typeTitle = ""
    @State var typeMessage = ""
    var body: some View {
        VStack {
            Button (action:{
                messageVM.addMessage(title: typeTitle, message: typeMessage)
                typeTitle = ""
                typeMessage = ""
                print("typeTitle after reset: \(typeTitle)")
                isShowSheet = false
            }) {
                Text("投稿する")
            }
        }
        TextField("タイトル", text: $typeTitle)
            .textFieldStyle(.roundedBorder)
            .frame(width: 355,height: 40)
            .padding(.all)
        TextEditor(text: $typeMessage)
            .frame(width: 355,height: 380)
            .overlay(
                RoundedRectangle(cornerRadius: 5) // 角が丸い四角形をオーバーレイとして追加
                    .stroke(.gray, lineWidth: 1) // このオーバーレイに枠線を適用
            )        }
}


