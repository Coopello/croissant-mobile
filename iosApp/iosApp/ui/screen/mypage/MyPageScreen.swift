import SwiftUI
import shared

struct MyPageScreen: View {
    private let metrics: GeometryProxy
    private let planRepository: PlanRepository
    private let fetchMyPlansUseCase: FetchMyPlansUseCase
    @State var selectedTabIndex: Int = 0
    
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
    
    private let mockUserData = User(
        id: 12,
        name: "井上晃平",
        proposedPlanList: [90, 0, 2],
        participatedPlanLIst: [12, 9, 0]
    )
    
    var body: some View {
        LazyVStack {
            MyPageHeader(
                metrics: metrics,
                user: mockUserData,
                selectedTabIndex: $selectedTabIndex
            ) { index in
                selectedTabIndex = index
                viewModel.onTabClicked(tabIndex: index)
            }
            .frame(
                maxHeight: metrics.size.height * 0.2,
                alignment: .top
            )
            
            ScrollView(.vertical) {
                ForEach(viewModel.state.plans, id: \.id) { plan in
                    MyPagePlanCell(
                        plan: plan,
                        metrics: metrics
                    )
                    .padding()
                }
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
