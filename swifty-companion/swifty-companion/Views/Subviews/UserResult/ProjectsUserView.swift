//
//  ProjectsUserView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 19/01/2023.
//

import SwiftUI

struct ProjectsUserView: View {
    var projects: [Project42]
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.white)
                .frame(height: 400)
            VStack(spacing: 40) {
                Text("Projects")
                    .font(AppFont.subtitle)
                    .padding(2)
                VStack {
                    List {
                        ForEach(projects) { project in
                            SingleProjectView(project: project)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.white)
                                .listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .frame(height: 400)
        }
        .padding(.horizontal, 20)
    }
}

struct ProjectsUserView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsUserView(projects: [Project42(id: 278708, final_mark: 100, status: "finished", project: ProjectName(name: "ft_transcendence"), cursus_ids: [21]), Project42(id: 2620577, final_mark:100, status: "finished", project: ProjectName(name: "ft_containers"), cursus_ids: [21])])
    }
}
