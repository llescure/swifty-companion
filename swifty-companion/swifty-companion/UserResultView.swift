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
                Image(type.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geo.size.width)
                    .foregroundColor(.accentColor)
            }
            .edgesIgnoringSafeArea(.all)
            VStack {
                Text(login)
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
    
    var type: CoalitionType {
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
