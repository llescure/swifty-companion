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
            AsyncImage(
                url: URL(string: achievementBadgeUrl),
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
            Text(achievement.name)
                .bold()
        }
        .font(.caption)    }
    
    var achievementBadgeUrl: String {
        return "https://api.intra.42.fr" + achievement.image
    }
}

struct SingleAchievementView_Previews: PreviewProvider {
    static var previews: some View {
        SingleAchievementView(achievement: Achievement42(id: 41, name: "All work and no play makes Jack a dull boy", image: "/uploads/achievement/image/41/SCO001.svg"))
    }
}
