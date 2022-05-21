import SwiftUI
import shared

struct ContentView: View {
	var body: some View {
        GeometryReader { metrics in
            VStack {
                HomeScreen(
                    metrics: metrics
                )
                Spacer()
                BottomTab(
                    metrics: metrics
                )
            }
        }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
