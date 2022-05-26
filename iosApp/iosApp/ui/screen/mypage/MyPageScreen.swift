import SwiftUI
import shared

struct MyPageScreen: View {
    private let planRepository: PlanRepository
    private let fetchMyPlansUseCase: FetchMyPlansUseCase
    @State var selectedTabIndex: Int = 0
    
    @ObservedObject var viewModel: MyPageScreenViewModel
    
    init() {
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
        GeometryReader { metrics in
            LazyVStack {
                MyPageHeader(
                    user: mockUserData,
                    selectedTabIndex: $selectedTabIndex
                ) { index in
                    selectedTabIndex = index
                    viewModel.onTabClicked(tabIndex: index)
                }
                .frame(
                    height: metrics.size.height * 0.2
                )
                
                ScrollView(.vertical) {
                    ForEach(viewModel.state.plans, id: \.id) { plan in
                        MyPagePlanCell(plan: plan)
                        .frame(
                            height: metrics.size.height * 0.28
                        )
                        .padding()
                    }
                }
                .frame(
                    height: metrics.size.height * 0.8
                )
            }
        }
        .frame(
            maxHeight: .infinity,
            alignment: .top
        )
    }
}
