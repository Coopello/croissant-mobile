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
            allPlans: [],
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
                    allPlans: self.state.allPlans,
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
            try createPublisher(flowWrapper: fetchRecentPlansUseCase.fetchRecentPlans())
                    .sink(receiveValue: { [weak self] (planArray: NSArray) in
                        planArray.forEach { throwable in
                            print("ここです \(throwable is Plan)")
                        }

                        if let plans : [Plan] = planArray as? [Plan] {
                            // FIXME: ここに問題があるっぽい
                            self?.state = HomeScreenState(
                                    howManyDaysLaterIsBeingClicked: 0,
                                    allPlans: [],
                                    error: ErrorState(
                                            errorOccurred: false,
                                            message: nil
                                    )
                            )
                        }
                    })
                    .store(in: &cancellables)

            createPublisher(flowWrapper: fetchRecentPlansUseCase.fetchRecentPlans())
                    .sink(
                            receiveValue: { [weak self] (planArray: NSArray) in
                                planArray.forEach { throwable in
                                    print("ここです \(throwable is Plan)")
                                }
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

