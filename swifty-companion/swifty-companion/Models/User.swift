//
//  User.swift
//  swifty-companion
//
//  Created by Léa Lescure on 17/01/2023.
//

import Foundation

struct User: Codable {
    var login: String
    var image: Image42
    var location: String?
    var cursus_users: [Cursus42]
    var achievements: [Achievement42]
    var projects_users: [Project42]
}

struct Cursus42: Codable {
    var grade: String?
    var level: Double
    var skills: [Skill42]
}

struct Skill42: Codable, Identifiable {
    var id: Int
    var name: String
    var level: Double
}

struct Project42: Codable, Identifiable {
    var id: Int
    var final_mark: Int?
    var status: String
    var project: ProjectName
    var cursus_ids: [Int]
    var marked_at: String?
}

struct ProjectName: Codable {
    var name: String
}

struct Achievement42: Codable, Identifiable {
    var id: Int
    var name: String
    var visible: Bool
}
