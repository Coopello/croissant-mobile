//
// Created by Kohei Inoue on 2022/05/06.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct LargeText: ViewModifier {
    private let textColor: Color
    
    init(textColor: Color) {
        self.textColor = textColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(.custom(
                MainActivityString.primaryFontBold,
                size: 24
            ))
            .foregroundColor(textColor)
    }
}

struct MediumText: ViewModifier {
    private let textColor: Color
    
    init(textColor: Color) {
        self.textColor = textColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(.custom(
                MainActivityString.primaryFontMedium,
                size: 20
            ))
            .foregroundColor(textColor)
    }
}

struct SmallText: ViewModifier {
    private let textColor: Color
    
    init(textColor: Color) {
        self.textColor = textColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(.custom(
                MainActivityString.primaryFontLight,
                size: 16
            ))
            .foregroundColor(textColor)
    }
}

struct ExtraSmallText: ViewModifier {
    private let textColor: Color
    
    init(textColor: Color) {
        self.textColor = textColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(.custom(
                MainActivityString.primaryFontMedium,
                size: 12
            ))
            .foregroundColor(textColor)
    }
}
