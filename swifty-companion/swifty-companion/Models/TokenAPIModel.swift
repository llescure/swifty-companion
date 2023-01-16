//
//  InitAPIModel.swift
//  swifty-companion
//
//  Created by Léa Lescure on 13/01/2023.
//

import Foundation

private var filePath: String {
    get {
        guard let filePath = Bundle.main.path(forResource: "42API-Info", ofType: "plist") else {
            fatalError("Couldn't find file '42API-Info.plist'.")
        }
        return filePath
    }
}

private var apiSecret: String {
    get {
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let secret = plist?.object(forKey: "API_SECRET") as? String else {
            fatalError("Couldn't find key 'API_SECRET' in '42API-Info.plist'.")
        }
        return secret
    }
}

private var apiUID: String {
    get {
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let uid = plist?.object(forKey: "API_UID") as? String else {
            fatalError("Couldn't find key 'API_UID' in '42API-Info.plist'.")
        }
        return uid
    }
}

class TokenAPIModel: ObservableObject {
    @Published var value: Token?
    @Published var isGenerated: Bool = false
    
    /* This function generates a token if the current token is null or if it will expire in less than 10 secondes */
    
    func generateToken() async throws -> Token? {
        // Transform the 42 api call into an URL
        let url = URL(string: "https://api.intra.42.fr/oauth/token")
        
        // Define the body of the 42 API call to generate a token
        let postBody = "grant_type=client_credentials&client_id=\(apiUID)&client_secret=\(apiSecret)"
        
        // Tranform the url into URLRequest to be able to modify its parameters like header, body
        guard let requestUrl = url else {
            print("Error: URL is empty")
            return nil
        }
        
        // Make the API call and get data and response
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.httpBody = postBody.data(using: String.Encoding.utf8)
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(Token.self, from: data)
    }
    
    /* This function checks if the token expires in less than 10 seconds
     If this is the case a new token is generated
     Else the function returns
     */
    
    func checkExpirationDateToken() async throws -> Token? {
        let url = URL(string: "https://api.intra.42.fr/oauth/token")
        guard let requestUrl = url else {
            print("Error: URL is empty")
            return nil
        }
        
        // Make the API call and get data and response
        var request = URLRequest(url: requestUrl)
        request.setValue(
            "Bearer \(value!.access_token)",
            forHTTPHeaderField: "Authorization"
        )
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        let currentToken = try decoder.decode(Token.self, from: data)
        if (currentToken.expires_in <= 10) {
            return try await generateToken()
        }
        return nil
    }
    
    @MainActor
    func fetchData () async {
        if (value == nil) {
            do {
                value = try await generateToken()
                isGenerated = true
            } catch {
                print("Error: Couldn't generate a token")
            }
        }
        else {
            do {
                if let renewedToken = try await checkExpirationDateToken() {
                    value = renewedToken
                }
            } catch {
                print("Error: Couldn't generate a token")
            }
        }
    }
}
