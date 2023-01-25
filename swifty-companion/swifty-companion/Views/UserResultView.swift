//
//  UserResultView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 17/01/2023.
//

import SwiftUI

struct UserResultView: View {
    @Binding var loginSelected: String
    @Binding var isShowingLoadingView: Bool
    
    @State var projectsButtonSelected: Bool = true
    @State var achievementsButtonSelected: Bool = false
    @State var skillsButtonSelected: Bool = false
    @State private var orientation = UIDevice.current.orientation
    
    var user: UserAPIModel
    
    var body: some View {
        ZStack(alignment:.center) {
            GeometryReader {geo in
                Image(coalitionType.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geo.size.width)
                    .foregroundColor(.accentColor)
            }
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: orientation.isLandscape ? 30 : 60) {
                HeaderUserResultView(user: user, coalitionType: coalitionType)
                ButtonsToSelectUserView(color: coalitionType.color, projectsButtonSelected: $projectsButtonSelected, achievementsButtonSelected: $achievementsButtonSelected, skillsButtonSelected: $skillsButtonSelected)
                if (projectsButtonSelected) {
                    ProjectsUserView(projects: projects, size: orientation.isLandscape ? 150 : 400)
                }
                else if (achievementsButtonSelected) {
                    AchievementsUserView(achievements: achievements, size: orientation.isLandscape ? 150 : 400)
                }
                else if (skillsButtonSelected) {
                    SkillsUserView(skills: skills, color: coalitionType.color, size: orientation.isLandscape ? 150 : 400)
                }
            }
        }
        .onDisappear {
            loginSelected = ""
            isShowingLoadingView = false
        }
        .onRotate {newOrientation in
                orientation = newOrientation
        }
    }
    
    var coalitionType: CoalitionType {
        switch user.coalition?.name {
        case "The Assembly":
            return CoalitionType.ParisCoalition[3]
        case "The Alliance":
            return CoalitionType.ParisCoalition[1]
        case "The Order":
            return CoalitionType.ParisCoalition[2]
        case "The Federation":
            return CoalitionType.ParisCoalition[0]
        default:
            return CoalitionType.ParisCoalition[4]
        }
    }
    
    var projects: [Project42] {
        var projects: [Project42] = []
        guard let allProjects: [Project42] = user.data?.projects_users else {
            print("Error: User data was not loaded")
            return projects
        }
        if (allProjects.count > 1) {
            for i in 0...allProjects.count - 1 {
                if (!allProjects[i].cursus_ids.isEmpty && allProjects[i].cursus_ids[0] == 21 && allProjects[i].status == "finished") {
                    projects.append(allProjects[i])
                }
            }
        }
        return projects
    }
    
    var achievements: [Achievement42] {
        var achievementWithoutDuplicate: [Achievement42] = []
        guard let achievements: [Achievement42] = user.data?.achievements else {
            print("Error: User data was not loaded")
            return []
        }
        if (achievements.count > 1) {
            for i in 0...achievements.count - 1 {
                if (!achievementWithoutDuplicate.contains(where: {$0.name == achievements[i].name}) && achievements[i].visible) {
                    achievementWithoutDuplicate.append(achievements[i])
                }
            }
        }
        return achievementWithoutDuplicate
    }
    
    var skills: [Skill42] {
        var skills: [Skill42] = []
        guard let cursus: [Cursus42] = user.data?.cursus_users else {
            print("Error: User data was not loaded")
            return skills
        }
        if (cursus.count > 1) {
            for i in 0...cursus.count - 1 {
                if (cursus[i].grade != nil) {
                    skills = cursus[i].skills
                }
            }
        }
        return skills
    }
}
