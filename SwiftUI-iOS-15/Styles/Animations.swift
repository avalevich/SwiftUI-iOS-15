//
//  Animations.swift
//  SwiftUI-iOS-15
//
//  Created by Alex on 15/08/2024.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}
