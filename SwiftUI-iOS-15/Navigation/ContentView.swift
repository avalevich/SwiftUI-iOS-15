//
//  ContentView.swift
//  SwiftUI-iOS-15
//
//  Created by Alex on 22/07/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                AccountView()
            case .notifications:
                EmptyView()
            case .library:
                EmptyView()
            }
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: 32)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Model())
}
