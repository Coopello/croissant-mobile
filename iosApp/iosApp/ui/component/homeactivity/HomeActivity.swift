import SwiftUI
import Combine
import shared

struct HomeActivity: View {
    @ObservedObject var viewModel: HomeActivityViewModel
    private var homeScreen: HomeScreen?
    
    init() {
        viewModel = HomeActivityViewModel()
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Group {
                    if viewModel.state.isHomeClicked {
                        homeScreen != nil ? homeScreen! : HomeScreen(metrics: metrics)
                    } else {
                        // HomeMyPageScreen()
                    }
                }
                
                Spacer()
                
                BottomTab(
                    metrics: metrics
                ) { tabIndex in
                    viewModel.onTriggerEvent(
                        event: HomeActivityEvent.OnTabClicked(
                            tabIndex: Int32(tabIndex)
                        )
                    )
                }
            }
        }
    }
}
