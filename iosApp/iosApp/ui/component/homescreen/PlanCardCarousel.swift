//
// Created by Kohei Inoue on 2022/05/08.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

struct PlanCardCarousel: View {
    private let metrics: GeometryProxy
    private let viewModel: HomeScreenViewModel

    private let itemPadding: CGFloat = 8
    @State private var currentIndex = 0
    @GestureState private var dragOffset: CGFloat = 0

    init(
        metrics: GeometryProxy,
        viewModel: HomeScreenViewModel
    ) {
        self.metrics = metrics
        self.viewModel = viewModel
    }

    var body: some View {
        HStack(spacing: itemPadding) {
            ForEach(viewModel.state.allPlans, id: \.id) { (plan: Plan) in
                PlanCard(metrics: metrics) {
                    viewModel.onPlanParticipateButtonClicked(plan: plan)
                }
            }
        }
        .offset(x: dragOffset)
        .offset(x: -CGFloat(currentIndex) * (metrics.size.width * 0.6 + itemPadding))
        .gesture(
            DragGesture()
                .updating(
                    self.$dragOffset,
                    body: { (value, state, _) in
                        state = value.translation.width
                    }
                )
                .onEnded { value in
                    var newIndex = self.currentIndex
                    let horizontalSlideDistance = value.translation.width
                    let planSize = viewModel.state.allPlans.count
                    
                    if abs(horizontalSlideDistance) > metrics.size.width * 0.3 {
                        newIndex = horizontalSlideDistance > 0 ? self.currentIndex - 1 : self.currentIndex + 1
                    }
                                       
                    if newIndex < 0 {
                        newIndex = 0
                    } else if newIndex + 1 > planSize {
                        newIndex = planSize - 1
                    }
                    
                    self.currentIndex = newIndex
                }
        )
    }
}
