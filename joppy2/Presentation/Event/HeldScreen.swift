//
//  HeldScreen.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import SwiftUI

struct HeldScreen: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


struct EventCellView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Chipaton ADCチームキックオフ")
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .padding(.all)
                Spacer()
                HStack {
                    Text("2024/2/2 14:00")
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
