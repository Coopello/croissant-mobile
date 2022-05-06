//
// Created by Kohei Inoue on 2022/04/24.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct DateCircleContainer: View {
    private let metrics: GeometryProxy
    // FIXME: 本来はこのリストをViewModelで管理するので更新処理は @ObservedObject をつけてViewModel内部で行う
    private let dateTextList: [(dateText: String, isSelected: Bool)]
    private let onClickDateCircle: (Int) -> Void

    init(
        dateTextList: [(dateText: String, isSelected: Bool)],
        metrics: GeometryProxy,
        onClickDateCircle: @escaping (Int) -> Void
    ) {
        self.dateTextList = dateTextList
        self.metrics = metrics
        self.onClickDateCircle = onClickDateCircle
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
                            metrics: metrics,
                            index: index,
                            onClickDateCircle: onClickDateCircle
                        )
                    } else {
                        DateCircleUnselected(
                            dateText: dateText,
                            metrics: metrics,
                            index: index,
                            onClickDateCircle: onClickDateCircle
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
    private let index: Int
    private let onClickDateCircle: (Int) -> Void

    init(
        dateText: String,
        metrics: GeometryProxy,
        index: Int,
        onClickDateCircle: @escaping (Int) -> Void
    ) {
        self.dateText = dateText
        self.metrics = metrics
        self.index = index
        self.onClickDateCircle = onClickDateCircle
    }

    var body: some View {
        ZStack {
            Circle().foregroundColor(Color(Colors.primaryOrange.name))
            Text(dateText)
                .modifier(LargeText(textColor: .white))
        }.frame(
            maxWidth: metrics.size.width * 0.20,
            maxHeight: .infinity
        ).onTapGesture {
            onClickDateCircle(index)
        }
    }
}

private struct DateCircleUnselected: View {
    private let metrics: GeometryProxy
    private let dateText: String
    private let index: Int
    private let onClickDateCircle: (Int) -> Void

    init(
        dateText: String,
        metrics: GeometryProxy,
        index: Int,
        onClickDateCircle: @escaping (Int) -> Void
    ) {
        self.dateText = dateText
        self.metrics = metrics
        self.index = index
        self.onClickDateCircle = onClickDateCircle
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(Colors.primaryOrange.name), lineWidth: 2)
                .foregroundColor(.white)
            Text(dateText)
                .modifier(SmallMediumText(textColor: Color(Colors.primaryOrange.name)))
        }.frame(
            maxWidth: metrics.size.width * 0.14,
            maxHeight: .infinity
        ).onTapGesture {
            onClickDateCircle(index)
        }
    }
}
