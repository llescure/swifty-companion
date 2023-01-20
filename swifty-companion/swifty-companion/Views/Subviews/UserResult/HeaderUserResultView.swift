//
//  HeaderUserResultView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 18/01/2023.
//

import SwiftUI

struct HeaderUserResultView: View {
    var user: UserAPIModel
    var coalitionType: CoalitionType

    var body: some View {
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
            VStack(alignment: .leading) {
                HStack(spacing: 40) {
                    Image(coalitionType.logo)
                        .resizable()
                        .frame(maxWidth: 30, maxHeight: 30)
                    VStack(alignment: .leading){
                        Text(login)
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                        Text(location)
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                    }
                }
                LevelBarView(color: coalitionType.color, level: level[0], levelCompletion: level[1], isRounded: true)
            }
        }
        .padding(.horizontal, 10)
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
}
