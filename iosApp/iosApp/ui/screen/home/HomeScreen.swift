//
// Created by Kohei Inoue on 2022/04/24.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

struct HomeScreen: View {
    private let metrics: GeometryProxy
    private let planRepository: PlanRepository
    private let fetchRecentPlansUseCase: FetchRecentPlansUseCase
    
    @ObservedObject var viewModel: HomeScreenViewModel
    
    init(metrics: GeometryProxy) {
        planRepository = FakePlanRepository()
        fetchRecentPlansUseCase = FetchRecentPlansUseCase(
                planRepository: planRepository
        )
        viewModel = HomeScreenViewModel(
            fetchRecentPlansUseCase: fetchRecentPlansUseCase
        )
        self.metrics = metrics
        
        viewModel.onViewCreated()
    }
    
    private let mockDateArray: [String] = [
        "7/16",
        "7/17",
        "7/18",
        "7/19",
        "7/20"
    ]
    
    var body: some View {
        VStack {
            DateSelectorContainer(
                viewModel: viewModel,
                dateTextList: mockDateArray,
                metrics: metrics
            ) { index in
                viewModel.onTriggerEvent(
                    event: HomeScreenEvent.ClickDate(howManyDaysLater: Int32(index))
                )
            }
            .frame(height: metrics.size.height * 0.15)
            
            TabButton(
                metrics: metrics,
                leftText: MainActivityString.formed,
                rightText: MainActivityString.unformed
            ) { index in
                
            }
            
            Spacer()
            
            PlanCardCarousel(
                metrics: metrics,
                plans: viewModel.state.plans,
                viewModel: viewModel
            ).frame(
                width: metrics.size.width,
                height: metrics.size.height * 0.6
            )
            
            Spacer()
        }
    }
}
