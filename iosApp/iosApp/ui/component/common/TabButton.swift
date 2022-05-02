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
        ZStack {
            BackGroundRoundView(
                    metrics: self.metrics,
                    leftText: self.leftText,
                    rightText: self.rightText
            )
        }
        .frame(
            maxWidth: metrics.size.width * 0.9,
            maxHeight: metrics.size.height * 0.08
        )
    }
}

private struct BackGroundRoundView: View {
    private let metrics: GeometryProxy
    private let leftText: String
    private let rightText: String

    private let textArray: [String]

    init(
        metrics: GeometryProxy,
        leftText: String,
        rightText: String
    ) {
        self.metrics = metrics
        self.leftText = leftText
        self.rightText = rightText
        self.textArray = [leftText, rightText]
    }

    var body: some View {
        HStack {
            Spacer()
            Text(leftText)
                .font(.custom(MainActivityString.primaryFontBold, size: 24))
                .foregroundColor(.white)
            Spacer()
            Text(rightText)
                .font(.custom(MainActivityString.primaryFontBold, size: 24))
                .foregroundColor(.white)
            Spacer()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(RoundedRectangle(cornerRadius: 32).fill(Color(Colors.primaryYellow.name)))
    }
}


