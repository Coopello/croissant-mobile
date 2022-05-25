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
            MyPageHeader(
                metrics: metrics,
                user: User(
                    id: 12,
                    name: "井上晃平",
                    proposedPlanList: [90, 0, 2],
                    participatedPlanLIst: [12, 9, 0]
                )
            ).frame(
                maxHeight: metrics.size.height * 0.2,
                alignment: .top
            )
            
            ForEach(viewModel.state.plans, id: \.id) { plan in
                MyPagePlanCell(
                    plan: plan,
                    metrics: metrics
                )
                .padding()
            }
            .frame(
                maxHeight: metrics.size.height * 0.7,
                alignment: .bottom
            )
        }.frame(
            maxHeight: metrics.size.height * 0.9,
            alignment: .top
        )
    }
}
