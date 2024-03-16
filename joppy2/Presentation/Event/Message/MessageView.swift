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


    var body: some View {
        VStack {
            List(messageVM.messages, id: \.id) {message in
                MessageRow(message: message.message, isMyMessage: true, date: message.createAt)
            }
            .navigationBarTitle("Chats", displayMode: .inline)
            HStack {
                TextField("Message", text: $typeMessage)
                .textFieldStyle(RoundedBorderTextFieldStyle())

                Button {
                    messageVM.addMessage(message: typeMessage)
                    typeMessage = ""
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                }
            }
            .padding()
        }
    }
}

