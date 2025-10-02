//
//  EditUserVIew.swift
//  SwiftDataProject
//
//  Created by Ryan on 30/09/2025.
//

import SwiftUI
import SwiftData

struct EditUserVIew: View {
    @Bindable var user: User
    
    var body: some View {
        Form {
                 TextField("Name", text: $user.name)
                 TextField("City", text: $user.city)
                 DatePicker("Join Date", selection: $user.joinDate)
             }
             .navigationTitle("Edit User")
             .navigationBarTitleDisplayMode(.inline)
         }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: [User.self, Job.self], configurations: config)
        let user = User(name: "Ryan", city: "Oxford", joinDate: .now)
        _ = Job(title: "Engineer", startDate: .now, user: user)
        return EditUserVIew(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
