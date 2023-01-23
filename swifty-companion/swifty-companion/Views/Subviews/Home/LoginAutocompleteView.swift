//
//  LoginAutoconpleteView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 16/01/2023.
//

import SwiftUI

struct LoginAutocompleteView: View {
    
    @StateObject var users = ParisCampusUsersAPIModel()
    @Binding var loginSelected: String
    @Environment(\.dismiss) private var dismiss
    
    var token: String
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { user in
                    HStack {
                        if (user.image.link != nil) {
                            AsyncImage(
                                url: URL(string: user.image.link!),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 50, maxHeight: 50)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                        }
                        else {
                            Image("Incognito")
                                .resizable()
                                .frame(maxWidth: 50, maxHeight: 50)
                        }
                        Text(user.login)
                            .font(AppFont.body)
                            .onTapGesture {
                                loginSelected = user.login
                                dismiss()
                            }
                    }
                }
            }
        }
        .searchable(text: $loginSelected, placement: .navigationBarDrawer(displayMode: .always))
        .disableAutocorrection(true)
        .onSubmit(of: .search) {
            Task {
                if (loginSelected.count >= 3) {
                    await users.fetchData(token: token, login:loginSelected)
                }
            }
        }
    }
    
    var searchResults: [CampusUsers] {
        if (users.isLoaded && !loginSelected.isEmpty) {
            return users.value!
        }
        else {
            return []
        }
    }
}
