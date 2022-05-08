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
            )
    )

    func onTriggerEvent(event: HomeScreenEvent) {
        switch event {
        case is HomeScreenEvent.ClickDate:
            let howManyDaysLater = (event as! HomeScreenEvent.ClickDate).howManyDaysLater
            state = HomeScreenState(
                    howManyDaysLaterIsBeingClicked: howManyDaysLater,
                    error: ErrorState(
                            errorOccurred: false,
                            message: nil
                    )
            )
        default: HomeScreenEvent.DoNothing()
        }
    }
    
    func onViewCreated() {
        do {
            createPublisher(flowWrapper: fetchRecentPlansUseCase.fetchRecentPlans())
                    .sink(
                            receiveCompletion: { completion in

                            },
                            receiveValue: { plan in

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

