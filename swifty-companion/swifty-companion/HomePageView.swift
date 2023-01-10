//
//  ContentView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 10/01/2023.
//

import SwiftUI

struct HomePageView: View {
    @State var loginSelected: String = ""
    @State private var isLoading: Bool = false
    
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
                    if (!isLoading) {
                        SearchLoginView(loginSelected: $loginSelected, isLoading: $isLoading)
                    }
                    else {
                        LoadingView()
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
