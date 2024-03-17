//
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
            VStack {
                Text("Joppy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.vertical, 40)
                Picker("TextFieldStyle", selection: $eventFieldTypes) {
                    Text("参加したい!").tag(EventFieldTypes.toC)
                    Text("開催したい！").tag(EventFieldTypes.toB)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                VStack {
                    switch eventFieldTypes {
                    case .toC:
                        VStack {
                            Text("イベント一覧")
                            HeldScreen()
                        }
                    case .toB:
                        EditButton(isShowSheet: $isShowSheet)

                    }
                }
                .animation(.easeInOut, value: eventFieldTypes)
                Spacer()
            }
        }
    }
}

#Preview {
    EventScreen()
}
