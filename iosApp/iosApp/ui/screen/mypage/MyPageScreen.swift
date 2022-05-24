import SwiftUI
import shared

struct MyPageScreen: View {
    private let metrics: GeometryProxy
    private let planRepository: PlanRepository
    private let fetchMyPlansUseCase: FetchMyPlansUseCase
    
    @ObservedObject var viewModel: MyPageScreenViewModel
    
    init(metrics: GeometryProxy) {
        self.metrics = metrics
        
        planRepository = FakePlanRepository()
        fetchMyPlansUseCase = FetchMyPlansUseCase(
            planRepository: planRepository
        )
        viewModel = MyPageScreenViewModel(
            fetchMyPlansUseCase: fetchMyPlansUseCase
        )
        viewModel.onInit()
    }
    
    var body: some View {
        LazyVStack {
            ForEach(viewModel.state.plans, id: \.id) { plan in
                MyPagePlanCell(
                    plan: plan,
                    metrics: metrics
                )
                .padding()
            }
        }
    }
}
