//
//  CustomButton.swift
//  joppy2
//
//  Created by 黒川良太 on 2024/03/10.
//

import SwiftUI

public struct CustomButton<T: View>: View {
    private let haptics: Haptics

    private let action: () -> Void
    
    private let label: () -> T
    
    public init(haptics: Haptics, action: @escaping () -> Void, label: @escaping () -> T) {
        self.haptics = haptics
        self.action = action
        self.label = label
    }

    public var body: some View {
        SwiftUI.Button {
            haptics.play()
            action()
        } label: {
            label()
        }
    }
}
