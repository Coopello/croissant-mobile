//
// Created by Kohei Inoue on 2022/04/24.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

struct DateSelectorContainer: View {
    private let viewModel: HomeScreenViewModel
    private let onClickDateCircle: (Int32) -> Void

    init(
        viewModel: HomeScreenViewModel,
        onClickDateCircle: @escaping (Int32) -> Void
    ) {
        self.viewModel = viewModel
        self.onClickDateCircle = onClickDateCircle
    }

    var body: some View {
        GeometryReader { metrics in
            HStack {
                Spacer()
                ForEach(viewModel.state.dates.indices) { (index: Int) in
                    let dateText = viewModel.state.dates[index]
                    let selectedIndex: Int32 = viewModel.state.howManyDaysLaterIsBeingClicked
                    let isSelected: Bool = Int32(index) == selectedIndex

                    switch isSelected {
                    case true:
                        DateSelectorWhenSelected(
                            dateText: dateText,
                            metrics: metrics,
                            index: Int32(index),
                            onClickDateCircle: onClickDateCircle
                        )
                        .frame(
                            width: metrics.size.width * 0.20
                        )
                    default:
                        DateSelectorWhenNotselected(
                            dateText: dateText,
                            metrics: metrics,
                            index: Int32(index),
                            onClickDateCircle: onClickDateCircle
                        )
                        .frame(
                            width: metrics.size.width * 0.14
                        )
                    }
                    Spacer()
                }
            }
        }
    }
}

private struct DateSelectorWhenSelected: View {
    private let metrics: GeometryProxy
    private let dateText: String
    private let index: Int32
    private let onClickDateCircle: (Int32) -> Void

    init(
        dateText: String,
        metrics: GeometryProxy,
        index: Int32,
        onClickDateCircle: @escaping (Int32) -> Void
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
        }.onTapGesture {
            onClickDateCircle(index)
        }
    }
}

private struct DateSelectorWhenNotselected: View {
    private let metrics: GeometryProxy
    private let dateText: String
    private let index: Int32
    private let onClickDateCircle: (Int32) -> Void

    init(
        dateText: String,
        metrics: GeometryProxy,
        index: Int32,
        onClickDateCircle: @escaping (Int32) -> Void
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
        }.onTapGesture {
            onClickDateCircle(index)
        }
    }
}
