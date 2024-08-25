//
//  HomeView.swift
//  SwiftUI-iOS-15
//
//  Created by Alex on 13/08/2024.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State var show = false
    @State var hasScrolled = false
    @State var showStatusBar = true
    @State var selectedId = UUID()
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView {
                scrollDetection
                featured
                Text("Courses".uppercased())
                    .font(.footnote.bold())
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
                    if !show {
                        cards
                    } else {
                        ForEach(courses) { item in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                                .opacity(0.3)
                                .padding(.horizontal, 30)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
            )
            if show {
                detail
            }
        }
        .statusBarHidden(!showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
            
        }
    }
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                hasScrolled = value < 0
            }
        })
    }
    var featured: some View {
        TabView {
            ForEach(featuredCourses) { item in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    FeaturedItem(course: item)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 40)
                        .rotation3DEffect(
                            .degrees(minX / -10),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob 1").offset(x: 250, y: -100))
    }
    var cards: some View {
        ForEach(courses) { course in
            CourseItem(namespace: namespace, course: course, show: $show)
                .onTapGesture {
                    
                    withAnimation(.openCard) {
                        selectedId = course.id
                        model.showDetail.toggle()
                        show.toggle()
                    }
            }
        }
    }
    var detail: some View {
        ForEach(courses) { course in
            if course.id == selectedId {
                CourseView(namespace: namespace, course: course, show: $show)
                    .zIndex(1)
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                            removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))
                        )
                    )
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Model())
}
