//
//  HeldScreen.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import SwiftUI

struct HeldScreen: View {
    var body: some View {
        ScrollView {
            EventCellView(title: "マンチカン", description: "マンチカンマンチカンマンチカン", timeStamp: "2024/2/2")
            EventCellView(title: "マンチカン", description: "マンチカンマンチカンマンチカン", timeStamp: "2024/2/2")
        }
    }
}


struct EventCellView: View {
    let title: String
    let description: String
    let timeStamp: String
    var body: some View {
        VStack {
            VStack {
                Text(title)
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .padding(.all)
                Text(description)
                Spacer()
                HStack {
                    Text(timeStamp)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .frame(width: 200, height: 50)
                    Spacer()
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



#Preview {
    HeldScreen()
}
