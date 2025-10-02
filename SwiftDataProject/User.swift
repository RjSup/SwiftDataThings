//
//  User.swift
//  SwiftDataProject
//
//  Created by Ryan on 30/09/2025.
//

import SwiftUI
import SwiftData

@Model
class User {
    var name: String = "None"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    @Relationship(deleteRule: .cascade, inverse: \Job.user) var jobs: [Job] = []
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
