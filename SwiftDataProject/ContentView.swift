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
    @State private var showingUpcoingOnly: Bool = false
    // to store the curr sort order
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    // store a path for navigation
    @State private var path: [User] = [User]()
    
    var body: some View {
        // navigation context using the path
        NavigationStack {
            UsersView(minJoinDate: showingUpcoingOnly ? .now : .distantPast, sortOrder: sortOrder)
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
                Button(showingUpcoingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcoingOnly.toggle()
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort  by name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        
                        Text("Sort by Join Data")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
