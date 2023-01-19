//
//  ButtonsToSelectUserView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 19/01/2023.
//

import SwiftUI

struct ButtonsToSelectUserView: View {
    var color: String
    @Binding var projectsButtonSelected: Bool
    @Binding var achievementsButtonSelected: Bool
    @Binding var skillsButtonSelected: Bool
    
    struct MyActionButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.subheadline.bold())
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .cornerRadius(8)
        }
    }
    
    var body: some View {
        HStack(spacing: 10) {
            Button(action:{}) {
                Text("Projects")
            }
            .buttonStyle(MyActionButtonStyle())
            .background(projectsButtonSelected ? Color(color) : Color("TransparentBlack").opacity(0.2))
            .foregroundColor(projectsButtonSelected ? .white : Color(color))
            .onTapGesture {
                projectsButtonSelected = true
                achievementsButtonSelected = false
                skillsButtonSelected = false
            }
            
            Button(action:{}) {
                Text("Achievements")
            }
            .buttonStyle(MyActionButtonStyle())
            .background(achievementsButtonSelected ? Color(color) : Color("TransparentBlack").opacity(0.2))
            .foregroundColor(achievementsButtonSelected ? .white : Color(color))
            .onTapGesture {
                projectsButtonSelected = false
                achievementsButtonSelected = true
                skillsButtonSelected = false
            }

            Button(action:{}) {
                Text("Skills")
            }
            .buttonStyle(MyActionButtonStyle())
            .background(skillsButtonSelected ? Color(color) : Color("TransparentBlack").opacity(0.2))
            .foregroundColor(skillsButtonSelected ? .white : Color(color))
            .onTapGesture {
                projectsButtonSelected = false
                achievementsButtonSelected = false
                skillsButtonSelected = true
            }
        }
        .padding(.horizontal, 20)
    }
}

struct ButtonsToSelectUserView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsToSelectUserView(color: "AssemblyPurple", projectsButtonSelected: .constant(true), achievementsButtonSelected: .constant(false), skillsButtonSelected: .constant(false))
    }
}
