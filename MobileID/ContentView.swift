//
//  ContentView.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // For a custom tab bar implementation
    @State private var selectedTab: Tab = .home
    
    @Query var users: [User]
    
    var body: some View {
//        if users.isEmpty {
//            LoginView()
//        } else {
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
//    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: User.self, configurations: config)
    
    return ContentView()
        .modelContainer(container)
}
