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
            HeaderUserResultView(user: user, coalitionType: coalitionType)
        }
        .onDisappear {
            loginSelected = ""
        }
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
