//
//  ConditionalButtonModifier.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 25/02/2024.
//

import SwiftUI

extension View {
    @ViewBuilder func conditionalButton<Content: View>(isVisible: Bool, @ViewBuilder content: () -> Content) -> some View {
        if isVisible {
            self.overlay(content(), alignment: .bottomTrailing)
        } else {
            self
        }
    }
}
