//
//  SingleSkillView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 20/01/2023.
//

import SwiftUI

struct SingleSkillView: View {
    var skill: Skill42

    var body: some View {
        HStack(spacing: 40) {
            Text(skill.name)
                .bold()
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
            LevelBarView(color: "AssemblyPurple", level: skill.level, levelCompletion: skill.level/20 * 100, isRounded: false)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct SingleSkillView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSkillView(skill: Skill42(id: 3, name: "Rigor", level: 7.78))
    }
}
