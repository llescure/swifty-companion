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
            RoundedRectangle(cornerRadius: 4)
                .fill(Color("TransparentBlack"))
                .frame(height: 400)
            VStack(spacing: 40) {
                Text("Achievements")
                    .font(AppFont.subtitle)
                    .padding(.vertical, 10)
                VStack {
                    List {
                        ForEach(achievements) { achievement in
                            SingleAchievementView(achievement: achievement)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color("TransparentBlack"))
                                .listRowInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 0))
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .frame(height: 390)
        }
        .padding(.horizontal, 20)    }
}

struct AchievementsUserView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsUserView(achievements: [Achievement42(id: 41, name: "All work and no play makes Jack a dull boy", visible: true), Achievement42(id: 169, name: "Bill Gates", visible: true)])
    }
}
