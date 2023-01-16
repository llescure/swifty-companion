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
                ForEach(searchResults, id: \.self) { name in
                    Text(name)
                        .onTapGesture {
                            loginSelected = name
                            dismiss()
                        }
                }
            }
        }
        .searchable(text: $loginSelected, placement: .navigationBarDrawer(displayMode: .always))
        .onSubmit(of: .search) {
            Task {
                if (loginSelected.count >= 3) {
                    await users.fetchData(token: token, login:loginSelected)
                }
            }
        }
    }
    
    var searchResults: [String] {
        if (users.isLoaded) {
            return users.value!
        }
        else {
            return []
        }
    }
}
