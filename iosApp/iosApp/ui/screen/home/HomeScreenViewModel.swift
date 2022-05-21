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
        let aDaySeconds = 86400
        let unixTimeFormatter = UnixTimeFormatter()
    
        let displayDates: [String] = [0, 1, 2, 3, 4].map { howManyDaysLater in
            unixTimeFormatter.unixTimeToString(
                unixTime: Double(aDaySeconds * howManyDaysLater) + Date().timeIntervalSince1970,
                format: MainActivityString.monthAndDay
            )
        }
        
        self.fetchRecentPlansUseCase = fetchRecentPlansUseCase
        self.state = HomeScreenState(
            howManyDaysLaterIsBeingClicked: 0,
            error: ErrorState(
                    errorOccurred: false,
                    message: nil
            ),
            plans: [],
            dates: displayDates
        )
    }
    
    deinit {
        cancellables.forEach { closeable in
            closeable.cancel()
        }
    }
    
    @Published var state: HomeScreenState

    func onTriggerEvent(event: HomeScreenEvent) {
        switch event {
        case is HomeScreenEvent.ClickDate:
            let howManyDaysLater = (event as! HomeScreenEvent.ClickDate).howManyDaysLater
            state = HomeScreenState(
                    howManyDaysLaterIsBeingClicked: howManyDaysLater,
                    error: self.state.error,
                    plans: self.state.plans,
                    dates: self.state.dates
            )
        case is HomeScreenEvent.UpdatePlans:
            guard let plans: [Plan] = (event as? HomeScreenEvent.UpdatePlans)?.newPlans else { return }
            
            self.state = HomeScreenState(
                howManyDaysLaterIsBeingClicked: self.state.howManyDaysLaterIsBeingClicked,
                error: self.state.error,
                plans: plans,
                dates: self.state.dates
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

