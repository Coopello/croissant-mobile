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
        ForEach(plans, id: \.id) { (plan: Plan) in
            PlanCard(metrics: metrics) {
                viewModel.onPlanParticipateButtonClicked(plan: plan)
            }
        }
    }
}