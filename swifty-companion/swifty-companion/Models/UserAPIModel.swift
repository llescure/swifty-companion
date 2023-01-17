//
//  UserAPIModel.swift
//  swifty-companion
//
//  Created by Léa Lescure on 17/01/2023.
//

import Foundation

class UserAPIModel: ObservableObject {
    @Published var data: User?
    @Published var coalition: Coalition?
    @Published var isDataLoaded: Bool = false
    
    /* This function gets the main info on the user */
    
    func getUserInfo(token: String, login: String) async throws -> User? {
        let baseURL = "https://api.intra.42.fr/v2/users/" + login.lowercased()
        let finalURL = URL(string: baseURL)
        
        guard let requestUrl = finalURL else {
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
        let currentUser = try decoder.decode(User.self, from: data)
        return currentUser
    }
    
    func getUserCoalitionInfo(token: String, login: String) async throws -> Coalition? {
        let baseURL = "https://api.intra.42.fr/v2/users/" + login.lowercased() + "/coalitions"
        let finalURL = URL(string: baseURL)
        
        guard let requestUrl = finalURL else {
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
        let currentUserCoalition = try decoder.decode([Coalition].self, from: data)
        let currentUserCoalitionSize = currentUserCoalition.count - 1
        // The cursus coalition in Paris have an id comprised between 45 and 48
        for i in 0...currentUserCoalitionSize {
            if (currentUserCoalition[i].id >= 45 && currentUserCoalition[i].id <= 48) {
                return currentUserCoalition[i]
            }
        }
        return nil
    }
    
    @MainActor
    func fetchData (token: String, login: String) async {
        do {
            data = try await getUserInfo(token: token, login: login)
            coalition = try await getUserCoalitionInfo(token: token, login: login)
            isDataLoaded = true
        } catch {
            print("Error: Couldn't get the info on this user")
        }
    }
}
