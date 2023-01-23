//
//  SkillsUserView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 19/01/2023.
//

import SwiftUI

struct SkillsUserView: View {
    var skills: [Skill42]
    var color: String
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color("TransparentBlack"))
                .frame(height: 400)
            VStack(spacing: 40) {
                Text("Skills")
                    .font(AppFont.subtitle)
                    .padding(.vertical, 10)
                VStack {
                    List {
                        ForEach(skills) { skill in
                            SingleSkillView(skill: skill, color: color)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color("TransparentBlack"))
                                .listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .frame(height: 390)
        }
        .padding(.horizontal, 20)    }
}

struct SkillsUserView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsUserView(skills: [Skill42(id: 3, name: "Rigor", level: 7.78), Skill42(id: 10, name: "Network & system administration", level: 7.6)], color: "AssemblyPurple")
    }
}
