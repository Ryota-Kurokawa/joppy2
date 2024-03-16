//
//  MessageRow.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import SwiftUI

struct MessageRow: View {
    let message: String
    let isMyMessage: Bool
    let user: String
    let date: Date

    var body: some View {
        HStack {
            if isMyMessage {
                Spacer()

                VStack {
                    Text(message)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(6)
                        .foregroundColor(Color.white)
                    Text(self.formattedDate(date: date))
                        .font(.callout)
                }
            } else {
                VStack(alignment: .leading) {
                    Text(message)
                        .padding(8)
                        .background(Color.green)
                        .cornerRadius(6)
                        .foregroundColor(Color.white)

                    HStack {
                        Text(user)

                        Text(self.formattedDate(date: date))
                            .font(.callout)
                    }
                }

                Spacer()
            }
        }
    }
    // 日付をフォーマットする関数
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
