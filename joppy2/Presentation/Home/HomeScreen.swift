//
//  HomeScreen.swift
//  joppy2
//
<<<<<<< HEAD
//  Created by 黒川良太 on 2024/03/06.
=======
//  Created by 黒川良太 on 2024/03/15.
>>>>>>> dev
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        TabView {
<<<<<<< HEAD
            Text("home")
                .tabItem {
                    Image(systemName: "balloon")
=======
            EventScreen()
                .tabItem {
                    Image(systemName: "house")
>>>>>>> dev
                    Text("Event")
                }
            WriteArticleScreen()
                .tabItem {
<<<<<<< HEAD
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
        }/*.navigationBarBackButtonHidden(true)*/
=======
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
>>>>>>> dev
    }
}

#Preview {
    HomeScreen()
}
