import SwiftUI
import Combine
import shared

struct HomeActivity: View {
    @ObservedObject var viewModel: HomeActivityViewModel
    
    init() {
        viewModel = HomeActivityViewModel()
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Group {
                    if viewModel.state.isHomeClicked {
                        HomeScreen(metrics: metrics)
                    } else {
                        MyPageScreen(metrics: metrics)
                    }
                }
                .frame(
                    maxHeight: metrics.size.height * 0.9,
                    alignment: .top
                )
                
                BottomTab(
                    metrics: metrics
                ) { tabIndex in
                    viewModel.onTriggerEvent(
                        event: HomeActivityEvent.OnTabClicked(
                            tabIndex: Int32(tabIndex)
                        )
                    )
                }
                .frame(
                    maxHeight: metrics.size.height * 0.1,
                    alignment: .bottom
                )
            }
        }
    }
}
