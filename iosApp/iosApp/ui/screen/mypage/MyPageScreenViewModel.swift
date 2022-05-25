import Combine
import shared
import SwiftUI

class MyPageScreenViewModel: ObservableObject {
    private let fetchMyPlansUseCase: FetchMyPlansUseCase
    private var cancellables = Set<AnyCancellable>()
    @Published var state: MyPageScreenState
    
    private var _myPlans: [Plan] = []
    
    init(
        fetchMyPlansUseCase: FetchMyPlansUseCase
    ) {
        self.fetchMyPlansUseCase = fetchMyPlansUseCase
        self.state = MyPageScreenState(
            plans: [],
            error: ErrorState(
                errorOccurred: false,
                message: nil
            )
        )
    }
    
    deinit {
        cancellables.forEach { closeable in
            closeable.cancel()
        }
    }
    
    func onTriggerEvent(event: MyPageScreenEvent) {
        switch event {
        case is MyPageScreenEvent.OnInit:
            let newPlans = (event as! MyPageScreenEvent.OnInit).newPlans
            _myPlans = newPlans
            
            self.state = MyPageScreenState(
                plans: newPlans.filter { plan in
                    plan.status == Plan.PlanStatus.notEstablished
                },
                error: self.state.error
            )
        case is MyPageScreenEvent.OnUpdate:
            let newPlans = (event as! MyPageScreenEvent.OnUpdate).newPlans
            guard let nowPlanStatus: Plan.PlanStatus = _myPlans.first?.status else { return }
            
            _myPlans = newPlans
            self.state = MyPageScreenState(
                plans: newPlans.filter { plan in
                    plan.status == nowPlanStatus
                },
                error: self.state.error
            )
        case is MyPageScreenEvent.OnUnFormedTabSelected:
            self.state = MyPageScreenState(
                plans: _myPlans.filter { plan in
                    plan.status == Plan.PlanStatus.notEstablished
                },
                error: self.state.error
            )
        case is MyPageScreenEvent.OnFormedTabSelected:
            self.state = MyPageScreenState(
                plans: _myPlans.filter { plan in
                    plan.status == Plan.PlanStatus.established
                },
                error: self.state.error
            )
        case is MyPageScreenEvent.OnHistoryTabSelected:
            self.state = MyPageScreenState(
                plans: _myPlans.filter { plan in
                    plan.status == Plan.PlanStatus.finished
                },
                error: self.state.error
            )
        default: MyPageScreenEvent.DoNothing()
        }
    }
    
    func onInit() {
        do {
            createPublisher(flowWrapper: fetchMyPlansUseCase.fetchMyPlans())
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { [weak self] completion in
                    },
                    receiveValue: { [weak self] plans in
                        guard let self = self else { return }
                        guard let newPlans = (plans as? [Plan]) else { return }
                        
                        self.onTriggerEvent(
                            event: MyPageScreenEvent.OnInit(
                                newPlans: newPlans
                            )
                        )
                    }
                )
                .store(in: &cancellables)
        } catch {
            self.state = state.errorOccurred(
                message: error.localizedDescription
            )
        }
    }
    
    func onTabClicked(tabIndex: Int) {
        let event: MyPageScreenEvent = {
            switch tabIndex {
            case 0:
                return MyPageScreenEvent.OnUnFormedTabSelected()
            case 1:
                return MyPageScreenEvent.OnFormedTabSelected()
            case 2:
                return MyPageScreenEvent.OnHistoryTabSelected()
            default:
                return MyPageScreenEvent.DoNothing()
            }
        }()
        
        onTriggerEvent(event: event)
    }
}
