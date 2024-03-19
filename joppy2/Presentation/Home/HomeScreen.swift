//
//  HomeScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/15.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        TabView {
            EventScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Event")
                        .foregroundColor(.white)
                }
            ArticleScreen()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Article")
                }
            UseCouponScreen()
                .tabItem {
                    Image(systemName: "ticket")
                    Text("Use Coupon")
                }
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    HomeScreen()
}
