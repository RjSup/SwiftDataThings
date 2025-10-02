//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Ryan on 02/10/2025.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
    
    // customize the query that gets run
    // inits a min join date and a sort order for sorting
    init(minJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        // gettings access to the query/ creating the query from whatever data gets passed in
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    UsersView(minJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: [User.self, Job.self])
}
