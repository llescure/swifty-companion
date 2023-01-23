//
//  AppFont.swift
//  swifty-companion
//
//  Created by Léa Lescure on 23/01/2023.
//

import Foundation
import SwiftUI

enum AppFont {
    
    static let header       = Font.custom(montserrat.extraBold.weight,  size: 40)
    static let header2      = Font.custom(montserrat.extraBold.weight,  size: 30)
    static let title        = Font.custom(montserrat.bold.weight,       size: 24)
    static let title2       = Font.custom(montserrat.black.weight,      size: 19)
    static let subtitle     = Font.custom(montserrat.bold.weight,       size: 20)
    static let body         = Font.custom(montserrat.medium.weight,       size: 17)
    static let body2         = Font.custom(montserrat.medium.weight,       size: 16)
    static let body3         = Font.custom(montserrat.bold.weight,       size: 14)
    static let body4        = Font.custom(montserrat.medium.weight,     size: 12)
    static let footnote     = Font.custom(montserrat.bold.weight,       size: 12)
    static let footnote2    = Font.custom(montserrat.semiBold.weight,   size: 12)
    static let login        = Font.custom(montserrat.regular.weight,    size: 10)
    
    static var custom: (montserrat, CGFloat) -> Font = { (weight, size) in
        return Font.custom(weight.weight, size: size)
    }
}

enum montserrat: String {
    
    case black        = "Montserrat-Black"
    case extraBold    = "Montserrat-ExtraBold"
    case bold         = "Montserrat-Bold"
    case semiBold     = "montserrat-SemiBold"
    case medium       = "montserrat-Medium"
    case regular      = "montserrat-Regular"
    case light        = "montserrat-Light"
    case extraLight   = "montserrat-ExtraLight"
    case thin         = "montserrat-Thin"
    
    var weight: String { return self.rawValue }
}
