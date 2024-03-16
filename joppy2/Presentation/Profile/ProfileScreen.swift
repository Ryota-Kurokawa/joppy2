
//  SignupScreen.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/06.
//

import SwiftUI
import CoreHaptics

enum ProfileFieldTypes {
    case individual
    case organization
}

struct ProfileScreen: View {
    @ScaledMetric(relativeTo: .body) var imageSize = CGFloat(2)
    @ScaledMetric(relativeTo: .body) var horizontalPadding: CGFloat = 4
    @ScaledMetric(relativeTo: .body) var verticalPadding: CGFloat = 2
    @ScaledMetric(relativeTo: .body) var cornerRadiusValue: CGFloat = 8
    @State var profileFieldTypes: ProfileFieldTypes = .individual
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Joppy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.vertical, 40)
                Picker("TextFieldStyle", selection: $profileFieldTypes) {
                    Text("個人").tag(ProfileFieldTypes.individual)
                    Text("organization").tag(ProfileFieldTypes.organization)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                VStack {
                    switch profileFieldTypes
                    {
                    case .individual:
                        PersonalScreen()
                    case .organization:
                        OrganizationScreen()
                    }
                }
                .animation(.easeInOut, value: profileFieldTypes)
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileScreen()
}
