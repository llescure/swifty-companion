//
//  ContentView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 10/01/2023.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var token: TokenAPIModel = TokenAPIModel()
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
                        .frame(height: 100)
                    if (!isLoading && token.isGenerated) {
                        SearchLoginView(loginSelected: $loginSelected, isLoading: $isLoading)
                    }
                    else {
                        LoadingView()
                    }
                }
            }
        }
        .task{
            await token.fetchData()
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
