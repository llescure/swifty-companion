//
//  Coalition.swift
//  swifty-companion
//
//  Created by Léa Lescure on 17/01/2023.
//

import Foundation

struct Coalition: Codable {
    var id: Int
    var name: String
}

struct CoalitionType: Codable {
    var id: Int
    var color: String
    var background: String
    var logo: String
    
    init(id: Int, color: String, background: String, logo: String) {
        self.id = id
        self.color = color
        self.background = background
        self.logo = logo
    }
}

extension CoalitionType {
    static let ParisCoalition: [CoalitionType] = [
        CoalitionType(id: 45, color: "FederationBlue", background: "FederationBackground", logo: "FederationLogo"),
        CoalitionType(id: 46, color: "AllianceGreen", background: "AllianceBackground", logo: "AllianceLogo"),
        CoalitionType(id: 47, color: "OrderOrange", background: "OrderBackground", logo: "OrderLogo"),
        CoalitionType(id: 48, color: "AssemblyPurple", background: "AssemblyBackground", logo: "AssemblyLogo"),
        CoalitionType(id: 0, color: "MainBlue", background: "Background", logo: "AppIcon")
    ]
}

