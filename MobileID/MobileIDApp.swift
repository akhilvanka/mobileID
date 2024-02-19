//
//  MobileIDApp.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/17/24.
//

import SwiftUI
import SwiftData

@main
struct MobileIDApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: User.self)
        }
    }
}
