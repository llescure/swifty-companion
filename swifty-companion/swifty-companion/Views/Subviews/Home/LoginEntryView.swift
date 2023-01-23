//
//  LoginEntryView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 10/01/2023.
//

import SwiftUI

struct LoginEntryView: View {
    @Binding var loginSelected: String
    @State var isShowingLoginAutocomplete: Bool = false
    var token: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Login")
                .font(AppFont.login)
                .foregroundColor(Color("LightGray"))
            TextField("", text: $loginSelected)
                .disabled(true)
                .textInputAutocapitalization(.never)
                .styledTextfield()
        }
        .padding(.bottom, 20)
        .padding(.top, 5)
        .padding(.horizontal, 20)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
        .padding(.horizontal, 40)
        .accessibilityLabel("Enter 42 login")
        .onTapGesture {
            isShowingLoginAutocomplete = true
        }
        .sheet(isPresented: $isShowingLoginAutocomplete){
            LoginAutocompleteView(loginSelected: $loginSelected, token: token)
        }
    }
}
