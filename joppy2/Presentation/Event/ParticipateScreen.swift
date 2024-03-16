//
//  ParticipateScreen.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//
//titleとdescriptionとtimeStampの引数持たせる

import SwiftUI


struct ArticleListView: View {
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    ScrollView {
                        CardView(title: "マンチカン", description: "マンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカンマンチカン", timeStamp: "2024/2/2")
                    }
                }
            }
          
        }
    }
}






#Preview {
     ArticleListView()
}


struct CardView: View {
    let title: String
    let description: String
    let timeStamp: String
    var body: some View {
        VStack {
            Spacer()
            VStack {
                VStack {
                    Text(title)
                        .font(.system(size: 23))
                        .fontWeight(.bold)
                        .padding(.vertical)
                    Text(description)
                        .padding(2.0)
                        .frame(width: 325,height: 140)
                    Spacer()
                    HStack {
                        Text(timeStamp)
                        Spacer()
                    }
                }
            }
            .frame(width: 330, height: 290)
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
    ArticleListView()
}

