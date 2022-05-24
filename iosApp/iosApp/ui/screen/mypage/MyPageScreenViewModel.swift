import Combine
import shared
import SwiftUI

class MyPageScreenViewModel: ObservableObject {
    private let fetchMyPlansUseCase: FetchMyPlansUseCase
    private var cancellables = Set<AnyCancellable>()
    @Published var state: MyPageScreenState
    
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
        print("判定 \(event is MyPageScreenEvent.UpdatePlans)")
        switch event {
        case is MyPageScreenEvent.UpdatePlans:
            guard let plans: [Plan] = (event as? MyPageScreenEvent.UpdatePlans)?.newPlans else { return }
            print("判定 \(plans.map({ plan in plan.shopName }))")
            
            self.state = MyPageScreenState(
                plans: plans,
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
                            event: MyPageScreenEvent.UpdatePlans(
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
}
