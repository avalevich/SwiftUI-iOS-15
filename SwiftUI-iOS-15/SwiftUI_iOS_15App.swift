//
//  SwiftUI_iOS_15App.swift
//  SwiftUI-iOS-15
//
//  Created by Alex on 22/07/2024.
//

import SwiftUI

@main
struct SwiftUI_iOS_15App: App {
    @ObservedObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
