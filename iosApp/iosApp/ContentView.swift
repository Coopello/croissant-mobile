import SwiftUI
import shared

struct ContentView: View {
	var body: some View {
        GeometryReader { metrics in
            TabButton (
                metrics: metrics,
                leftText: MainActivityString.unformed,
                rightText: MainActivityString.formed
            ) { (toggleIndex: Int32) in
                
            }
        }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
