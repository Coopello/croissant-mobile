//
// Created by Kohei Inoue on 2022/04/24.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct DateCircleContainer: View {
    private let metrics: GeometryProxy
    private let dateTextList: [(dateText: String, isSelected: Bool)]

    init(
        dateTextList: [(dateText: String, isSelected: Bool)],
        metrics: GeometryProxy
    ) {
        self.dateTextList = dateTextList
        self.metrics = metrics
    }

    var body: some View {
        GeometryReader { metrics in
            HStack {
                Spacer()
                ForEach(dateTextList.indices) { (index: Int) in
                    let item = dateTextList[index]
                    let dateText = item.dateText
                    let isSelected = item.isSelected

                    if isSelected {
                        DateCircleSelected(
                                dateText: dateText,
                                metrics: metrics
                        )
                    } else {
                        DateCircleUnselected(
                                dateText: dateText,
                                metrics: metrics
                        )
                    }
                    Spacer()
                }
            }
        }
    }
}

private struct DateCircleSelected: View {
    private let metrics: GeometryProxy
    private let dateText: String

    init(
            dateText: String,
            metrics: GeometryProxy
    ) {
        self.dateText = dateText
        self.metrics = metrics
    }

    var body: some View {
        ZStack {
            Circle().foregroundColor(Color(Colors.primaryOrange.name))
            Text(dateText)
                .modifier(MediumText(textColor: .white))
        }
    }
}

private struct DateCircleUnselected: View {
    private let metrics: GeometryProxy
    private let dateText: String

    init(
            dateText: String,
            metrics: GeometryProxy
    ) {
        self.dateText = dateText
        self.metrics = metrics
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(Colors.primaryOrange.name), lineWidth: 2)
                .foregroundColor(.white)
            Text(dateText)
                .modifier(MediumText(textColor: Color(Colors.primaryOrange.name)))
        }
    }
}
