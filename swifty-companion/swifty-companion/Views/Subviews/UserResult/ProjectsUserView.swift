//
//  ProjectsUserView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 19/01/2023.
//

import SwiftUI

struct ProjectsUserView: View {
    var projects: [Project42]
    var size: CGFloat
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color("TransparentBlack"))
                .frame(height: size)
            VStack(spacing: size == 400 ? 40 : 10) {
                Text("Projects")
                    .font(AppFont.subtitle)
                    .padding(.vertical, size == 400 ? 10 : 4)
                VStack {
                    List {
                        ForEach(projects) { project in
                            SingleProjectView(project: project)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color("TransparentBlack"))
                                .listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .frame(height: size - 10)
        }
        .padding(.horizontal, size == 400 ? 20 : 5)
    }
}

struct ProjectsUserView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsUserView(projects: [Project42(id: 278708, final_mark: 100, status: "finished", project: ProjectName(name: "ft_transcendence"), cursus_ids: [21]), Project42(id: 2620577, final_mark:100, status: "finished", project: ProjectName(name: "ft_containers"), cursus_ids: [21])], size: 400)
    }
}
