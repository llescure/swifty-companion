//
//  SkillsUserView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 19/01/2023.
//

import SwiftUI

struct SkillsUserView: View {
    var skills: [Skill42]
    
    var body: some View {
        Text("Skills")
    }
}

struct SkillsUserView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsUserView(skills: [Skill42(id: 3, name: "Rigor", level: 7.78), Skill42(id: 10, name: "Network & system administration", level: 7.6)])
    }
}
