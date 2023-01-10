//
//  StyledTextField.swift
//  swifty-companion
//
//  Created by Léa Lescure on 10/01/2023.
//

import SwiftUI

extension View {
    func styledTextfield() -> some View {
        self
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color("lightgray"))
            .disableAutocorrection(true)
    }
}
