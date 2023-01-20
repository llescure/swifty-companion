//
//  SingleAchievementView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 19/01/2023.
//

import SwiftUI

struct SingleAchievementView: View {
    var achievement: Achievement42
    
    var body: some View {
        HStack(spacing: 50) {
            Image(achievement.name)
                .frame(maxWidth: 50, maxHeight: 50)
            Text(achievement.name)
                .bold()
        }
        .font(.caption)
        .padding(.bottom, 20)
    }
}

struct SingleAchievementView_Previews: PreviewProvider {
    static var previews: some View {
        SingleAchievementView(achievement: Achievement42(id: 41, name: "All work and no play makes Jack a dull boy", visible: true))
    }
}
