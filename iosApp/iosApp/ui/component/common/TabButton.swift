//
// Created by Kohei Inoue on 2022/05/02.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct TabButton: View {
    private let metrics: GeometryProxy
    private let leftText: String
    private let rightText: String
    private let togglePadding: CGFloat = 4
    private let cornerRadius: CGFloat = 32
    private let onTabClickedBeforeAnimaiton: (Int32) -> Void

    private func getFrameWidth() -> CGFloat {
        return metrics.size.width * 0.9
    }
    
    private func getFrameHeight() -> CGFloat {
        return metrics.size.height * 0.08
    }
    
    @State private var togglePositionX: CGFloat = 0
    private func onTabClicked(tabIndex: Int32) {
        onTabClickedBeforeAnimaiton(tabIndex)
        switch tabIndex {
        case 0:
            togglePositionX = 0
        default:
            togglePositionX = getFrameWidth() / 2 - (togglePadding * 2)
        }
    }
    
    init(
        metrics: GeometryProxy,
        leftText: String,
        rightText: String,
        onTabClicked: @escaping (Int32) -> Void
    ) {
        self.metrics = metrics
        self.leftText = leftText
        self.rightText = rightText
        self.onTabClickedBeforeAnimaiton = onTabClicked
    }

    var body: some View {
        let frameWidth = getFrameWidth()
        let frameHeight = getFrameHeight()
        
        ZStack {
            ZStack(alignment: .leading) {
                BackGroundRoundView(cornerRadius: cornerRadius)
                ToggleView(
                    frameWidth: frameWidth / 2,
                    cornerRadius: cornerRadius
                )
                .padding(togglePadding)
                .offset(x: togglePositionX)
                .animation(.easeInOut(duration: 0.2), value: togglePositionX)
            }
            HStack {
                Spacer()
                // TODO: fontをthemeみたいなものを作って統一する
                Text(leftText)
                    .font(.custom(MainActivityString.primaryFontBold, size: 24))
                    .foregroundColor(.white)
                Spacer()
                Spacer()
                Text(rightText)
                    .font(.custom(MainActivityString.primaryFontBold, size: 24))
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .frame(
            maxWidth: frameWidth,
            maxHeight: frameHeight
        ).gesture(
            DragGesture(minimumDistance: 0).onEnded { value in
                let centralBorder: CGFloat = (frameWidth / 2)
                let tabIndex: Int32 = value.location.x < centralBorder ? 0 : 1
                onTabClicked(tabIndex: tabIndex)
            }
        )
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
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
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
                maxWidth: frameWidth,
                maxHeight: .infinity
            )
    }
}


