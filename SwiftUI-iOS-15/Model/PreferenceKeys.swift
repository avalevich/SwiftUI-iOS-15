//
//  PreferenceKeys.swift
//  SwiftUI-iOS-15
//
//  Created by Alex on 15/08/2024.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
