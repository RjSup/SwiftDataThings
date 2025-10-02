//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Ryan on 30/09/2025.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self, Job.self])
    }
}
