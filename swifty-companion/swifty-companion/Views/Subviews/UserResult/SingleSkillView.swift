//
//  SingleSkillView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 20/01/2023.
//

import SwiftUI

struct SingleSkillView: View {
    var skill: Skill42
    var color: String

    var body: some View {
        HStack(spacing: 40) {
            Text(skill.name)
                .bold()
                .font(AppFont.footnote2)
                .frame(maxWidth: .infinity, alignment: .leading)
            LevelBarView(color: color, level: skill.level, levelCompletion: skill.level/20 * 100, isRounded: false)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct SingleSkillView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSkillView(skill: Skill42(id: 3, name: "Rigor", level: 3.00), color: "AssemblyPurple")
    }
}
