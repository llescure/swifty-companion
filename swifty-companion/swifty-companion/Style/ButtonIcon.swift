//
//  ButtonIcon.swift
//  swifty-companion
//
//  Created by Léa Lescure on 10/01/2023.
//

import SwiftUI

struct ButtonIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 20) {
            configuration.title
            configuration.icon
        }
        .bold()
        .padding(10)
        .frame(maxWidth: .infinity)
    }
}

extension LabelStyle where Self == ButtonIconLabelStyle {
    static var buttonIcon: Self { Self() }
}
