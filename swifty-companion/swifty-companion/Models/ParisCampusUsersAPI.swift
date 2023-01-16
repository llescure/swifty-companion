//
//  ParisCampusUsersAPI.swift
//  swifty-companion
//
//  Created by Léa Lescure on 16/01/2023.
//

import Foundation

/* This function generates a list of all login on 42 Paris campus */

func generateListOf42ParisCampusUsers(token: String, login: String) async throws -> [String]? {
    let url = URL(string: "https://api.intra.42.fr/v2/campus/1/users")
    guard let requestUrl = url else {
        print("Error: URL is empty")
        return nil
    }
    var request = URLRequest(url: requestUrl)
    request.setValue(
        "Bearer \(token)",
        forHTTPHeaderField: "Authorization"
    )
    let (data, _) = try await URLSession.shared.data(for: request)
    let decoder = JSONDecoder()
    var list: [String] = []
    let currentCampusUsers = try decoder.decode([CampusUsers].self, from: data)
    let campusUsersSize = currentCampusUsers.count - 1
    
    for i in 0...campusUsersSize {
        list.append(currentCampusUsers[i].login)
    }
    return list
}
