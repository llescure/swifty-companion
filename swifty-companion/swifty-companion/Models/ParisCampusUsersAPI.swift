//
//  ParisCampusUsersAPI.swift
//  swifty-companion
//
//  Created by Léa Lescure on 16/01/2023.
//

import Foundation

class ParisCampusUsersAPIModel: ObservableObject {
    @Published var value: [CampusUsers]?
    @Published var isLoaded: Bool = false
    
    /* This function generates a list of all login on 42 Paris campus */
    
    func generateListOf42ParisCampusUsers(token: String, login: String) async throws -> [CampusUsers]? {
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
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(response)
        print(data)
        let decoder = JSONDecoder()
        let currentCampusUsers = try decoder.decode([CampusUsers].self, from: data)
        print(currentCampusUsers)
        
        return currentCampusUsers
    }
    
    @MainActor
    func fetchData (token: String, login: String) async {
        do {
            value = try await generateListOf42ParisCampusUsers(token: token, login: login)
            isLoaded = true
        } catch {
            print("Error: Couldn't get the list of 42 users from the Paris Campus")
        }
    }
}
