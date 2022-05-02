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
            maxWidth: metrics.size.width * 0.9,
            maxHeight: metrics.size.height * 0.08
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


