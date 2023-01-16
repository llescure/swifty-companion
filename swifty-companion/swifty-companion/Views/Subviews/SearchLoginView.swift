//
//  SearchLoginView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 10/01/2023.
//

import SwiftUI

struct SearchLoginView: View {
    @Binding var loginSelected: String
    @Binding var isLoading: Bool
    var token: String
    
    var body: some View {
        VStack(spacing: 10) {
            LoginEntryView(loginSelected: $loginSelected, token: token)
            Button (action: {
//                if (!loginSelected.isEmpty) {
                    isLoading = true
//                }
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
}
