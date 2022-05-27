//
// Created by Kohei Inoue on 2022/05/02.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct TabButton: View {
    private let leftText: String
    private let rightText: String
    private let togglePadding: CGFloat = 4
    private let cornerRadius: CGFloat = 32
    private let onTabClickedBeforeAnimaiton: (Int8) -> Void
    
    @State private var togglePositionX: CGFloat = 0
    private func onTabClicked(
        tabIndex: Int8,
        frameWidth: CGFloat
    ) {
        onTabClickedBeforeAnimaiton(tabIndex)
        switch tabIndex {
        case 0:
            togglePositionX = 0
        default:
            togglePositionX = frameWidth / 2 - (togglePadding * 2)
        }
    }
    
    init(
        leftText: String,
        rightText: String,
        onTabClicked: @escaping (Int8) -> Void
    ) {
        self.leftText = leftText
        self.rightText = rightText
        self.onTabClickedBeforeAnimaiton = onTabClicked
    }

    var body: some View {
        GeometryReader { metrics in
            ZStack {
                ZStack(alignment: .leading) {
                    BackGroundRoundView(cornerRadius: cornerRadius)
                    ToggleView(
                        frameWidth: metrics.size.width / 2,
                        cornerRadius: cornerRadius
                    )
                    .padding(togglePadding)
                    .offset(x: togglePositionX)
                    .animation(.easeInOut(duration: 0.2), value: togglePositionX)
                }
                HStack {
                    Spacer()
                    Text(leftText).modifier(LargeText(textColor: .white))
                    Spacer()
                    Spacer()
                    Text(rightText).modifier(LargeText(textColor: .white))
                    Spacer()
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0).onEnded { value in
                    let centralBorder: CGFloat = (metrics.size.width / 2)
                    let tabIndex: Int8 = value.location.x < centralBorder ? 0 : 1
                    onTabClicked(
                        tabIndex: tabIndex,
                        frameWidth: metrics.size.width
                    )
                }
            )
        }
    }
}

private struct BackGroundRoundView: View {
    private let cornerRadius: CGFloat
    
    init(cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        RoundedRectangle(
            cornerRadius: cornerRadius
        )
        .fill(Color(Colors.primaryYellow.name))
    }
}

private struct ToggleView: View {
    private let frameWidth: CGFloat
    private let cornerRadius: CGFloat
    
    init(
        frameWidth: CGFloat,
        cornerRadius: CGFloat
    ) {
        self.frameWidth = frameWidth
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color(Colors.primaryOrange.name))
            .frame(
                width: frameWidth
            )
    }
}


