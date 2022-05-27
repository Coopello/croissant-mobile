//
// Created by Kohei Inoue on 2022/04/24.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

struct HomeScreen: View {
    private let planRepository: PlanRepository
    private let fetchRecentPlansUseCase: FetchRecentPlansUseCase
    
    @ObservedObject var viewModel: HomeScreenViewModel
    
    init() {
        planRepository = FakePlanRepository()
        fetchRecentPlansUseCase = FetchRecentPlansUseCase(
                planRepository: planRepository
        )
        viewModel = HomeScreenViewModel(
            fetchRecentPlansUseCase: fetchRecentPlansUseCase
        )
        
        viewModel.onViewCreated()
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack(alignment: .center) {
                DateSelectorContainer(viewModel: viewModel) { index in
                    viewModel.onTriggerEvent(
                        event: HomeScreenEvent.ClickDate(howManyDaysLater: Int32(index))
                    )
                }
                .frame(
                    height: metrics.size.height * 0.2
                )
                
                TabButton(
                    leftText: MainActivityString.formed,
                    rightText: MainActivityString.unformed
                ) { index in
                    
                }
                .frame(
                    width: metrics.size.width * 0.9,
                    height: metrics.size.height * 0.08
                )
                
                Spacer()
                
                PlanCardCarousel(
                    plans: viewModel.state.plans,
                    viewModel: viewModel
                )
                .frame(
                    height: metrics.size.height * 0.64
                )
                .padding()
                
                Spacer()
            }
        }
    }
}
