//  SignupScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import SwiftUI
import CoreHaptics

enum EventFieldTypes {
    case toC
    case toB
}

struct EventScreen: View {
    @ScaledMetric(relativeTo: .body) var imageSize = CGFloat(2)
    @ScaledMetric(relativeTo: .body) var horizontalPadding: CGFloat = 4
    @ScaledMetric(relativeTo: .body) var verticalPadding: CGFloat = 2
    @ScaledMetric(relativeTo: .body) var cornerRadiusValue: CGFloat = 8
    @State var eventFieldTypes: EventFieldTypes = .toC
    @State var isShowSheet: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBackgroundColor
                    .ignoresSafeArea()
                VStack {
                    Text("Joppy")
                        .font(.custom("AvenirNext-Heavy", size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,30)
                    Picker("TextFieldStyle", selection: $eventFieldTypes) {
                        Text("参加したい！").tag(EventFieldTypes.toC)
                        Text("開催したい！").tag(EventFieldTypes.toB)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    VStack {
                        switch eventFieldTypes {
                        case .toC:
                            HeldScreen()
                        case .toB:
                            Text("ああああ")
                        }
                    }
                    .animation(.easeInOut, value: eventFieldTypes)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    EventScreen()
}
