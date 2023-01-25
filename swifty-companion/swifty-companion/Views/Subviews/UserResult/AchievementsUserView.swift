//
//  AchievementsUserView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 19/01/2023.
//

import SwiftUI

struct AchievementsUserView: View {
    var achievements: [Achievement42]
    var size: CGFloat
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color("TransparentBlack"))
                .frame(height: size)
            VStack(spacing: size == 400 ? 40 : 10) {
                Text("Achievements")
                    .font(AppFont.subtitle)
                    .padding(.vertical, size == 400 ? 10 : 4)
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
            .frame(height: size - 10)
        }
        .padding(.horizontal, size == 400 ? 20 : 5)
    }
}

struct AchievementsUserView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsUserView(achievements: [Achievement42(id: 41, name: "All work and no play makes Jack a dull boy", visible: true), Achievement42(id: 169, name: "Bill Gates", visible: true)], size: 400)
    }
}
