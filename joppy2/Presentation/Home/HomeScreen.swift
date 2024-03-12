//
//  HomeScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        TabView {
            EventScreen()
                .tabItem {
                    Image(systemName: "balloon")
                    Text("Event")
                }
            WriteArticleScreen()
                .tabItem {
                    Image(systemName: "yensign.circle")
                    Text("Write Your Article")
                }
            UseCouponScreen()
                .tabItem {
                    Image(systemName: "ticket.fill")
                    Text("Coupon")
                }
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeScreen()
}
