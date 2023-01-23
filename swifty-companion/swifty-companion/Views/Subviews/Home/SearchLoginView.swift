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
    @State var showingAlert: Bool = false
    @State var isShowingLoadingView: Bool = false
    var token: String
    
    var body: some View {
        NavigationStack {
            if (!isShowingLoadingView) {
                VStack(spacing: 10) {
                    LoginEntryView(loginSelected: $loginSelected, token: token)
                    Button (action: {
                        if (!loginSelected.isEmpty) {
                            Task {
                                isShowingLoadingView = true
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
                .alert("The user you are looking for doesn't exit", isPresented: $user.isNotExisting) {
                    Button("OK", role:.cancel) {
                        loginSelected = ""
                        isShowingLoadingView = false
                    }
                }
            }
            else if (isShowingLoadingView){
                LoadingView()
                    .alert("The user you are looking for doesn't exit", isPresented: $user.isNotExisting) {
                        Button("OK", role:.cancel) {
                            loginSelected = ""
                            isShowingLoadingView = false
                        }
                    }
            }
        }
        .navigationDestination(isPresented: $user.isDataLoaded) {
            if (user.data != nil) {
                UserResultView(loginSelected: $loginSelected, isShowingLoadingView: $isShowingLoadingView, user: user)
            }
        }
    }
}
