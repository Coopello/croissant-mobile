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
    
    private let dateArray: [(dateText: String, isSelected: Bool)] = [
        ("7/16", true),
        ("7/17", false),
        ("7/18", false),
        ("7/19", false),
        ("7/20", false)
    ]
    
    var body: some View {
        VStack {
            DateCircleContainer(
                dateTextList: dateArray,
                metrics: metrics
            ) { index in
                
            }
            .frame(height: metrics.size.height * 0.15)
            
            Spacer()
        }
    }
}
