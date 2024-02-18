//
//  NavigationTabView.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/17/24.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

enum Tab: String {
    case home
    case web
    case lost
}

var tabItems = [
    TabItem(text: "Home", icon: "house", tab: .home),
    TabItem(text: "Welcome", icon: "safari", tab: .web),
    TabItem(text: "Lost", icon: "lock", tab: .lost)
]


struct NavigationTabView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(tabItems) { item in
                Button {
                    selectedTab = item.tab
                } label: {
                    VStack(spacing: 0) {
                        Image(systemName: item.icon)
                            .symbolVariant(.fill)
                            .font(.body.bold())
                            .frame(width: 44, height: 29)
                        Text(item.text)
                            .font(.caption2)
                            .lineLimit(1)
                    }
                    .frame(maxWidth: .infinity)
                }
                .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            }
        }
        .padding(.all)
        .frame(height: 88, alignment: .top)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}
