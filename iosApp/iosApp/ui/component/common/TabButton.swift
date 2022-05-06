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

    @State private var tabPositionX: CGFloat = 0
    private func onTabClicked(tabIndex: Int32) {
        // TODO: tabIndexによってtabPositionXを切り替える処理をここに実装
    }
    
    init(
        metrics: GeometryProxy,
        leftText: String,
        rightText: String
    ) {
        self.metrics = metrics
        self.leftText = leftText
        self.rightText = rightText
    }

    var body: some View {
        let frameWidth = metrics.size.width * 0.9
        let frameHeight = metrics.size.height * 0.08
        
        ZStack {
            ZStack(alignment: .leading) {
                BackGroundRoundView(metrics: metrics)
                ToggleView(metrics: metrics)
                    .padding(4)
            }
            HStack {
                Spacer()
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
    private let metrics: GeometryProxy

    init(metrics: GeometryProxy) {
        self.metrics = metrics
    }

    var body: some View {
        RoundedRectangle(
            cornerRadius: 32
        )
        .fill(Color(Colors.primaryYellow.name))
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}

private struct ToggleView: View {
    private let metrics: GeometryProxy
    
    init(
        metrics: GeometryProxy
    ) {
        self.metrics = metrics
    }
    
    var body: some View {
        RoundedRectangle(
            cornerRadius: 32
        )
        .fill(Color(Colors.primaryOrange.name))
        .frame(
            maxWidth: metrics.size.width * 0.45,
            maxHeight: .infinity
        )
    }
}


