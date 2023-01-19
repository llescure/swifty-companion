//
//  LoadingView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 10/01/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: Color("MainBlue")))
            .scaleEffect(6)
            .frame(height: 120)
            .padding(.top, 5)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
