//
//  AccountView.swift
//  SwiftUI-iOS-15
//
//  Created by Alex on 13/08/2024.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 32)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.5))
            Text("Alex")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text("Poland")
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink {
                HomeView()
            } label: {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Help", systemImage: "questionmark")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Help", systemImage: "questionmark")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .foregroundStyle(.primary)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("Apple", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundStyle(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button(action: {
                        isDeleted = true
                    }, label: {
                        Label("Delete", systemImage: "trash")
                    })
                    .tint(.red)
                    pinButton
                }
            }
            
            Link(destination: URL(string: "https://google.com")!) {
                HStack {
                    Label("Google", systemImage: "magnifyingglass")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundStyle(.secondary)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .foregroundStyle(.primary)
    }
    
    var pinButton: some View {
        Button(action: {
            isPinned.toggle()
        }, label: {
            Label(isPinned ? "Unpin" : "Pin", systemImage: isPinned ? "pin.slash" : "pin")
        })
        .tint(isPinned ? .gray : .yellow)
    }
}

#Preview {
    AccountView()
}
