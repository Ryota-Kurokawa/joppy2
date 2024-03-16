//
//  MessageView.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import SwiftUI

struct MessageView: View {
    private var messageVM = MessageViewModel()
    @State private var typeMessage = ""
    @State private var typeTitle = ""


    var body: some View {
        VStack {
            List(messageVM.messages, id: \.id) {message in
                MessageRow(title: message.title, message: message.message, isMyMessage: true, date: message.createAt)
            }
            .navigationBarTitle("Chats", displayMode: .inline)
            HStack {
                TextField("Message", text: $typeMessage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("title", text: $typeTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())

                Button {
                    messageVM.addMessage(title: typeTitle, message: typeMessage)
                    typeTitle = ""
                    typeMessage = ""
                    print("typeTitle after reset: \(typeTitle)") // デバッグ出力
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                }
            }
            .padding()
        }
    }
}

