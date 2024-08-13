//
//  Styles.swift
//  SwiftUI-iOS-15
//
//  Created by Alex on 23/07/2024.
//

import SwiftUI


struct StrokeStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var cornerRadius: CGFloat = 30.0
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .circular)
                    .stroke(
                        .linearGradient(
                            colors: [.white.opacity(colorScheme == .dark ? 0.6 : 0.3), .black.opacity(colorScheme == .dark ? 0.3 : 0.1)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .blendMode(.overlay)
            )
    }
}

extension View {
    func customStroke(cornerRadius: CGFloat) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
