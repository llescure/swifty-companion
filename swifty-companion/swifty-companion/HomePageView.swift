//
//  ContentView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 10/01/2023.
//

import SwiftUI

struct HomePageView: View {
    @State var loginSelected: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack(alignment:.center) {
                GeometryReader { geo in
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: geo.size.width)
                        .foregroundColor(.accentColor)
                }
                .edgesIgnoringSafeArea(.all)
                VStack (spacing: 100){
                    Image("Logo")
                    VStack(spacing: 10) {
                        LoginEntryView(loginSelected: $loginSelected)
                        Button (action: {}) {
                            Label("SEARCH", systemImage: "magnifyingglass")
                                .labelStyle(.buttonIcon)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("MainBlue"))
                        .padding(.bottom, 60)
                        .padding(.horizontal, 40)
                    }
                }
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
