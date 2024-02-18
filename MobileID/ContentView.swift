//
//  ContentView.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    // For a custom tab bar implementation
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .home:
                    UserHome2()
                case .web:
                    UserHome()
                case .lost:
                    UserGridView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            NavigationTabView(selectedTab: $selectedTab)
        }
    }
}


#Preview {
    ContentView()
}
