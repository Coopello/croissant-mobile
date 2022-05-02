import SwiftUI
import shared

struct ContentView: View {
	var body: some View {
        GeometryReader { metrics in
            TabButton (
                metrics: metrics,
                leftText: "未成立",
                rightText: "成立済"
            )
        }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
