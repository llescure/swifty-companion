//
//  UserResultView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 17/01/2023.
//

import SwiftUI

struct UserResultView: View {
    @Binding var loginSelected: String
    var user: UserAPIModel
    
    var body: some View {
        ZStack(alignment:.center) {
            GeometryReader {geo in
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geo.size.width)
                    .foregroundColor(.accentColor)
            }
            .edgesIgnoringSafeArea(.all)
            VStack {
                Text(login)
            }
        }
        .onDisappear {
            loginSelected = ""
        }
    }
    
    var login: String {
        guard let login = user.data?.login else {
            print("error")
            return ""
        }
        return login
    }
}
