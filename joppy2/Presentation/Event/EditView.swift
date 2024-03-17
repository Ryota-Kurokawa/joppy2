//
//  EditView.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import SwiftUI


struct EditView: View {
    @Binding var isShowSheet: Bool
    var DescriptionVM = EventViewModel()
    @State var typeTitle = ""
    @State var typeDescription = ""
    var body: some View {
        VStack {
            Button (action:{
                DescriptionVM.addMessage(title: typeTitle, description: typeDescription)
                typeTitle = ""
                typeDescription = ""
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
        TextEditor(text: $typeDescription)
            .frame(width: 355,height: 380)
            .overlay(
                RoundedRectangle(cornerRadius: 5) // 角が丸い四角形をオーバーレイとして追加
                    .stroke(.gray, lineWidth: 1) // このオーバーレイに枠線を適用
            )        }
}


