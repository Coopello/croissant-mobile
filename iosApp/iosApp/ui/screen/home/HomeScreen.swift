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
    
    private let dateArray: [String] = ["7/16", "7/17", "7/18", "7/19", "7/20"]
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                HStack {
                    ForEach(0..<dateArray.count) { index in
                        if index == viewModel.state.howManyDaysLaterIsBeingClicked {
                            DateCircleSelected(dateText: dateArray[index]).onTapGesture {
                                viewModel.onTriggerEvent(
                                    event: HomeScreenEvent.ClickDate(
                                        howManyDaysLater: Int32(index)
                                    )
                                )
                            }
                        } else {
                            DateCircleUnselected(dateText: dateArray[index]).onTapGesture {
                                viewModel.onTriggerEvent(
                                    event: HomeScreenEvent.ClickDate(
                                        howManyDaysLater: Int32(index)
                                    )
                                )
                            }
                        }
                    }
                }
                .frame(height: metrics.size.height * 0.15)
                
                Spacer()
            }
        }
    }
}
