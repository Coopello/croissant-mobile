import Combine
import Foundation
import shared

class HomeActivityViewModel: ObservableObject {
    @Published var state: HomeActivityState
    
    init() {
        state = HomeActivityState(
            isHomeClicked: true,
            isMyPageClicked: false
        )
    }
    
    func onTriggerEvent(event: HomeActivityEvent) {
        switch event {
        case is HomeActivityEvent.OnTabClicked:
            let tabIndex = (event as! HomeActivityEvent.OnTabClicked).tabIndex
            state = HomeActivityState(
                isHomeClicked: tabIndex == 0,
                isMyPageClicked: tabIndex == 1
            )
        default: HomeActivityEvent.DoNothing()
        }
    }
}
