//
//  SearchLoginView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 10/01/2023.
//

import SwiftUI

struct SearchLoginView: View {
    @Binding var loginSelected: String
    @StateObject private var user: UserAPIModel = UserAPIModel()
    var token: String
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                LoginEntryView(loginSelected: $loginSelected, token: token)
                Button (action: {
                    if (!loginSelected.isEmpty) {
                        Task {
                            await user.fetchData(token:token, login:loginSelected)
                        }
                    }
                }) {
                    Label("SEARCH", systemImage: "magnifyingglass")
                        .labelStyle(.buttonIcon)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("MainBlue"))
                .padding(.bottom, 60)
                .padding(.horizontal, 40)
            }
            .frame(height: 120)
        }
        .navigationDestination(isPresented: $user.isDataLoaded) {
            UserResultView(loginSelected: $loginSelected, user: user)
        }
    }
}
