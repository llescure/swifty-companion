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

class InitAPIModel: ObservableObject {
    @Published var token: Token?
    @Published var parisCampusUsers: [String] = []
    @Published var isTokenGenerated: Bool = false
    
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
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.httpBody = postBody.data(using: String.Encoding.utf8)
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(Token.self, from: data)
    }
    
    // This function checks if the token expires in less than 10 seconds
    // If this is the case a new token is generated
    // Else the function returns
    
//    func checkExpirationDateToken() async {
//        let url = URL(string: "https://api.intra.42.fr/oauth/token")
//        guard let requestUrl = url else { return print("Error the url is empty") }
//        var request = URLRequest(url: requestUrl)
//
//        request.setValue(
//            "Bearer \(token!.access_token)",
//            forHTTPHeaderField: "Authorization"
//        )
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print(error as Any)
//                return
//            }
//            else if let data = data {
//                let tokenData = try? JSONDecoder().decode(Token.self, from: data)
//                if (tokenData!.expires_in <= 10) {
//
//                }
//                else {
//                    return
//                }
//            }
//        }
//        task.resume()
//    }
    
    @MainActor
    func fetchParisCampusUsers () async {
            do {
                token = try await generateToken()
                isTokenGenerated = true
            } catch {
                print("An error occured")
            }
        }
}
