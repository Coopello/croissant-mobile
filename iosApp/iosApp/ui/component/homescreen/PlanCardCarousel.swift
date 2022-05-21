//
// Created by Kohei Inoue on 2022/05/08.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

struct PlanCardCarousel: View {
    private let metrics: GeometryProxy
    private let plans: [Plan]
    private let viewModel: HomeScreenViewModel
    
    @GestureState private var dragOffset: CGFloat = 0
    @State private var currentIndex = 0
    
    private let itemPadding: CGFloat = 16

    init(
        metrics: GeometryProxy,
        plans: [Plan],
        viewModel: HomeScreenViewModel
    ) {
        self.metrics = metrics
        self.plans = plans
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            ForEach(plans, id: \.id) { (plan: Plan) in
                PlanCard(
                    metrics: metrics,
                    plan: plan
                ) {
                    viewModel.onPlanParticipateButtonClicked(plan: plan)
                }
            }
        }
        .offset(x: dragOffset)
        .offset(x: -CGFloat(self.currentIndex) * (metrics.size.width * 0.6))
        .offset(x: metrics.size.width * 0.3)
        .gesture(
            DragGesture()
                .updating(self.$dragOffset, body: { (value, state, _) in
                    if self.currentIndex == 0, value.translation.width < 0 {
                        state = value.translation.width / 5
                    } else if self.currentIndex == (self.plans.count - 1), value.translation.width > 0 {
                        state = value.translation.width / 5
                    } else {
                        state = value.translation.width
                    }
                })
                .onEnded({ value in
                    var newIndex = self.currentIndex
                    
                    if abs(value.translation.width) > metrics.size.width * 0.2 {
                        newIndex = value.translation.width > 0 ? self.currentIndex - 1 : self.currentIndex + 1
                    }
                    
                    if newIndex < 0 {
                        newIndex = 0
                    } else if newIndex > (self.plans.count - 1) {
                        newIndex = self.plans.count - 1
                    }
                    
                    self.currentIndex = newIndex
                })
        )
        .animation(
            .interpolatingSpring(
                mass: 0.4,
                stiffness: 150,
                damping: 80,
                initialVelocity: 0.1
            )
        )
    }
}
