//
//  LevelBarView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 18/01/2023.
//

import SwiftUI

struct LevelBarView: View {
    @State private var containerWidth: CGFloat = 0
    
    var color: String
    var level: Double
    var levelCompletion: Double
    var isRounded: Bool
    
    var maxWidth: Double {
        return min(containerWidth / 100 * levelCompletion, containerWidth)
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.clear)
                    .onAppear {
                        containerWidth = geo.size.width
                    }
            }
            RoundedRectangle(cornerRadius: 5)
                .fill(Color("MainBlack"))
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(color))
                    .frame(width: maxWidth)
                
                Text("level \(levelTxt) - \(levelCompletionTxt)%")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 6, leading: isRounded ? containerWidth/4 : 8, bottom: 6, trailing: 12))
                    .font(AppFont.footnote2)
            }
            .frame(minWidth: maxWidth)
            .fixedSize()
        }
        .frame(width: isRounded ? 250 : 150)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    var levelTxt: String  {
        if (isRounded) {
            return String(format: "%.0f", level) }
        return String(format:"%.2f" , level)
    }
    
    var levelCompletionTxt: String  {
        return String(format: "%.0f", levelCompletion)
    }
}

struct LevelBarView_Previews: PreviewProvider {
    static var previews: some View {
        LevelBarView(color: "AssemblyPurple", level: 10, levelCompletion: 20, isRounded: false)
    }
}
