//
// Created by Kohei Inoue on 2022/04/24.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared
import Combine

class HomeScreenViewModel: ObservableObject {
    private let fetchRecentPlansUseCase: FetchRecentPlansUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(
        fetchRecentPlansUseCase: FetchRecentPlansUseCase
    ) {
        self.fetchRecentPlansUseCase = fetchRecentPlansUseCase
    }
    
    deinit {
        cancellables.forEach { closeable in
            closeable.cancel()
        }
    }
    
    @Published var state: HomeScreenState = HomeScreenState(
            howManyDaysLaterIsBeingClicked: 0,
            error: ErrorState(
                    errorOccurred: false,
                    message: nil
            ),
            plans: []
    )

    func onTriggerEvent(event: HomeScreenEvent) {
        switch event {
        case is HomeScreenEvent.ClickDate:
            let howManyDaysLater = (event as! HomeScreenEvent.ClickDate).howManyDaysLater
            state = HomeScreenState(
                    howManyDaysLaterIsBeingClicked: howManyDaysLater,
                    error: self.state.error,
                    plans: self.state.plans
            )
        case is HomeScreenEvent.UpdatePlans:
            guard let plans: [Plan] = (event as? HomeScreenEvent.UpdatePlans)?.newPlans else { return }
            
            self.state = HomeScreenState(
                howManyDaysLaterIsBeingClicked: self.state.howManyDaysLaterIsBeingClicked,
                error: self.state.error,
                plans: plans
            )
            
        default: HomeScreenEvent.DoNothing()
        }
    }
    
    func onViewCreated() {
        do {
            createPublisher(flowWrapper: fetchRecentPlansUseCase.fetchRecentPlans())
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { [weak self] completion in
                    },
                    receiveValue: { [weak self] plans in
                        guard let self = self else { return }
                        guard let newPlans = (plans as? [Plan]) else { return }
                        
                        self.onTriggerEvent(
                            event: HomeScreenEvent.UpdatePlans(
                                newPlans: newPlans
                            )
                        )
                    }
                )
                .store(in: &cancellables)
        } catch {
            state = state.errorOccurred(
                    message: error.localizedDescription
            )
        }
    }

    func onPlanParticipateButtonClicked(plan: Plan) {

    }
}

