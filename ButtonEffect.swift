//
//  ButtonFile.swift
//  TutorLab
//
//  Created by Benjamin G. Harrison on 5/11/26.
//

import SwiftUI

struct ButtonEffect: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.85 : 1.0)
            .brightness(configuration.isPressed ? -0.1 : 0)
            .shadow(radius: configuration.isPressed ? 0 : 5)
            .animation(.spring(response: 0.15, dampingFraction: 0.4), value: configuration.isPressed)
    }
}
