//
//  ContentView.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        UserHome2()
        TabView {
            UserHome2()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            UserHome()
                .tabItem {
                    Image(systemName: "lock")
                    Text("Secondary")
                }
            UserGridView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Grid")
                }
        }
    }
}

#Preview {
    ContentView()
}
