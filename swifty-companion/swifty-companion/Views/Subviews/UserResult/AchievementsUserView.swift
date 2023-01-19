//
//  AchievementsUserView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 19/01/2023.
//

import SwiftUI

struct AchievementsUserView: View {
    var achievements: [Achievement42]
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.white)
                .frame(height: 400)
            VStack(spacing: 40) {
                Text("Achievements")
                    .font(.title)
                    .bold()
                VStack {
                    List {
                        ForEach(achievements) { achievement in
                            SingleAchievementView(achievement: achievement)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.white)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .frame(height: 400)
        }
        .padding(.horizontal, 20)    }
}

struct AchievementsUserView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsUserView(achievements: [Achievement42(id: 41, name: "All work and no play makes Jack a dull boy", image: "/uploads/achievement/image/41/SCO001.svg"), Achievement42(id: 169, name: "Bill Gates", image: "/uploads/achievement/image/169/BADGE_SCOLARITY_billgates.svg")])
    }
}
