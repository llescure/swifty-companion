//
//  UserResultView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 17/01/2023.
//

import SwiftUI

struct UserResultView: View {
    @Binding var loginSelected: String
    var user: UserAPIModel
    
    var body: some View {
        ZStack(alignment:.center) {
            GeometryReader {geo in
                Image(coalitionType.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geo.size.width)
                    .foregroundColor(.accentColor)
            }
            .edgesIgnoringSafeArea(.all)
            HStack {
                AsyncImage(
                    url: URL(string: user.data!.image.link!),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                            .clipShape(Circle())
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                HStack {
                    Image(coalitionType.logo)
                        .resizable()
                        .frame(maxWidth: 30, maxHeight: 30)
                    VStack {
                        Text(login)
                        Text(location)
                        LevelBarView(color: coalitionType.color, level: level[0], levelCompletion: level[1])
                    }
                }
            }
        }
        .onDisappear {
            loginSelected = ""
        }
    }
    
    var login: String {
        guard let login = user.data?.login else {
            print("error")
            return ""
        }
        return login
    }
    
    var location: String {
        guard let location = user.data?.location else {
            return "Unknown"
        }
        return location
    }
    
    var level: [Double] {
        var currentLevelCompletion: Double = 0
        var currentLevel: Double = 0
        
        guard let cursus: [Cursus42] = user.data?.cursus_users else {
            print("error")
            return ([currentLevel, currentLevelCompletion])
        }
        for i in 0...cursus.count - 1 {
            if (cursus[i].grade != nil) {
                currentLevelCompletion = cursus[i].level.truncatingRemainder(dividingBy: 1)
                currentLevel = cursus[i].level - currentLevelCompletion
            }
        }
        return ([currentLevel, currentLevelCompletion * 100])
    }
    
    var coalitionType: CoalitionType {
        switch user.coalition?.name {
        case "The Assembly":
            return CoalitionType.ParisCoalition[3]
        case "The Alliance":
            return CoalitionType.ParisCoalition[1]
        case "The Order":
            return CoalitionType.ParisCoalition[2]
        case "The Federation":
            return CoalitionType.ParisCoalition[0]
        default:
            return CoalitionType.ParisCoalition[4]
        }
    }
}
