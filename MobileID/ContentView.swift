//
//  ContentView.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    // For a custom tab bar implementation
    @State private var selectedWindow = 0
    
    var body: some View {
//        UserHome2()
//        TabView {
//            UserHome2()
//                .tabItem {
//                    Image(systemName: "house")
//                    Text("Home")
//                }
//            UserHome()
//                .tabItem {
//                    Image(systemName: "lock")
//                    Text("Secondary")
//                }
//            UserGridView()
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("Grid")
//                }
//        }
//        .onAppear() {
//        }
        ZStack {
            UserHome2()
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.secondarySystemBackground))
                    .frame(maxHeight: 100)
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    ContentView()
}
