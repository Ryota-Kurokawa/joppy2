//
//  MessageRow.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import SwiftUI

struct MessageRow: View {
    let title: String
    let message: String
    let isMyMessage: Bool
    let date: Date

    var body: some View {
        HStack {
            if isMyMessage && !title.isEmpty {
                Spacer()

                VStack {
                    Text(title)
                    Text(message)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(6)
                        .foregroundColor(Color.white)
                    Text(self.formattedDate(date: date))
                        .font(.callout)
                }
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
