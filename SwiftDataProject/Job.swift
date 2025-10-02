//
//  Job.swift
//  SwiftDataProject
//
//  Created by Ryan on 02/10/2025.
//
import SwiftUI
import SwiftData

@Model
class Job {
    var title: String = ""
    var startDate: Date = Date.now
    // Back-reference to the owning user; this should match the inverse on User.jobs
    var user: User?

    init(title: String, startDate: Date, user: User? = nil) {
        self.title = title
        self.startDate = startDate
        self.user = user
    }
}
