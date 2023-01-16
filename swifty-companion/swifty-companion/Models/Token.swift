//
//  Token.swift
//  swifty-companion
//
//  Created by Léa Lescure on 13/01/2023.
//

import Foundation

struct Token: Codable {
    var access_token: String
    var token_type: String
    var expires_in: Double
    var scope: String
    var created_at: Double
    
    init(access_token: String, token_type: String, expires_in: Double, scope: String, created_at: Double) {
        self.access_token = access_token
        self.token_type = token_type
        self.expires_in = expires_in
        self.scope = scope
        self.created_at = created_at
    }
}
