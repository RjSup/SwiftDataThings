//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Ryan on 30/09/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // get the swiftdata context
    @Environment(\.modelContext) var modelContext
    // query swiftdata for user User.name instances
    // using a predicate to access the exact data we need
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("R") &&
        user.city == "New York" ||
        user.name.localizedStandardContains("J") &&
        user.city == "London"
    }, sort: \User.name) var users: [User]
    
    // store a path for navigation
    @State private var path: [User] = [User]()
    
    var body: some View {
        // navigation context using the path
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    // ensure database is clear before add to it
                    try? modelContext.delete(model: User.self)
                    
                    // add data to db
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
