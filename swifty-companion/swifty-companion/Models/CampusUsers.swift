//
//  CampusUsers.swift
//  swifty-companion
//
//  Created by Léa Lescure on 16/01/2023.
//

import Foundation

struct CampusUsers: Codable {
    var login: String
    var image: Image42
}

struct Image42: Codable {
    var link: String
}
