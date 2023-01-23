//
//  SingleButtonStyleView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 22/01/2023.
//

import SwiftUI

struct SingleButtonStyleView: View {
    var text: String
    var color: String
    var buttonSelected: Bool
    
    var body: some View {
        Text(text)
            .frame(height: 35)
            .frame(maxWidth: .infinity)
            .background(buttonSelected ? Color(color) : Color("TransparentBlack").opacity(0.2))
            .foregroundColor(buttonSelected ? .white : Color(color))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(AppFont.footnote)
        
    }
}

struct SingleButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleButtonStyleView(text: "Projects", color: "AssemblyPurple", buttonSelected: true)
    }
}
