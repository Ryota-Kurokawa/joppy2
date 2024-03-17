//
//  HeldScreen.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import SwiftUI

struct HeldScreen: View {
    private var descriptionVM = EventViewModel()
    @State private var typeDescription = ""
    @State private var isShowSheet = false
    var body: some View {
        VStack{
            List(descriptionVM.events, id: \.id) {event in
                EventCellView(title: event.title, description: event.description, createAt: event.createAt, isMyMessage: true, customDate: event.customDate)
            }
        }
    }
}


struct EventCellView: View {
    let title: String
    let description: String
    let createAt: Date
    let isMyMessage: Bool
    let customDate: Date

    var body: some View {
        if isMyMessage && !title.isEmpty {
            VStack {
                VStack {
                    Text(title)
                        .font(.system(size: 23))
                        .fontWeight(.bold)
                        .padding(.all)
                    Text(description)
                    Spacer()
                    HStack {
                        Text("投稿日時\(formattedDate(date: createAt))")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .frame(width: 200, height: 50)
                        Spacer()
                        Text("開催日時\(formattedDate(date:customDate))")
                    }
                }
                .frame(width: 330, height: 90)
                .padding()
                .background(.white)
                .cornerRadius(8)
                .clipped()
                .shadow(color: .gray.opacity(0.7), radius: 5)
                Spacer()

            }
            .padding()
        }
    }
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    HeldScreen()
}

