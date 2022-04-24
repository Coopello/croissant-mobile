//
// Created by Kohei Inoue on 2022/04/24.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

class HomeScreenViewModel: ObservableObject {
    private let fetchRecentPlansUseCase: FetchRecentPlansUseCase
    
    init(
        fetchRecentPlansUseCase: FetchRecentPlansUseCase
    ) {
        self.fetchRecentPlansUseCase = fetchRecentPlansUseCase
    }
    
    @Published var state: HomeScreenState = HomeScreenState(
        howManyDaysLaterIsBeingClicked: 0
    )

    func onTriggerEvent(event: HomeScreenEvent) {
        switch event {
        case is HomeScreenEvent.ClickDate:
            let howManyDaysLater = (event as! HomeScreenEvent.ClickDate).howManyDaysLater
            state = HomeScreenState(
                    howManyDaysLaterIsBeingClicked: howManyDaysLater
            )
        default: HomeScreenEvent.DoNothing()
        }
    }
}
