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
                        HomeScreen()
                    } else {
                        MyPageScreen()
                    }
                }
                .frame(
                    height: metrics.size.height * 0.9
                )
                
                BottomTab() { tabIndex in
                    viewModel.onTriggerEvent(
                        event: HomeActivityEvent.OnTabClicked(
                            tabIndex: Int32(tabIndex)
                        )
                    )
                }
                .frame(
                    height: metrics.size.height * 0.1
                )
            }
        }
    }
}
