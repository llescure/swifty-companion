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
    
    var body: some View {
        VStack(spacing: 10) {
            LoginEntryView(loginSelected: $loginSelected)
            Button (action: {
                isLoading = true
            }) {
                Label("SEARCH", systemImage: "magnifyingglass")
                    .labelStyle(.buttonIcon)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("MainBlue"))
            .padding(.bottom, 60)
            .padding(.horizontal, 40)
            .frame(height: 120)
        }
    }
    
    struct SearchLoginView_Previews: PreviewProvider {
        static var previews: some View {
            SearchLoginView(loginSelected: .constant(""), isLoading: .constant(false))
        }
    }
}
