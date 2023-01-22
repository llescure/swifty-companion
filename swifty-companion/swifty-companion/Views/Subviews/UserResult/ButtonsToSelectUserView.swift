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
        }
    }
    
    var body: some View {
        HStack(spacing: 10) {
            SingleButtonStyleView(text: "Projects", color: color, buttonSelected: projectsButtonSelected)
                    .onTapGesture {
                projectsButtonSelected = true
                achievementsButtonSelected = false
                skillsButtonSelected = false
            }
            SingleButtonStyleView(text: "Achievements", color: color, buttonSelected: achievementsButtonSelected)
            .onTapGesture {
                projectsButtonSelected = false
                achievementsButtonSelected = true
                skillsButtonSelected = false
            }
            SingleButtonStyleView(text: "Skills", color: color, buttonSelected: skillsButtonSelected)
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
