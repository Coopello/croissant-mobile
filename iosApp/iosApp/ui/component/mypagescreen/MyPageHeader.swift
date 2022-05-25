import SwiftUI
import shared

struct MyPageHeader: View {
    private let metrics: GeometryProxy
    private let user: User
    
    init(
        metrics: GeometryProxy,
        user: User
    ) {
        self.metrics = metrics
        self.user = user
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(user.name)
                    .modifier(LargeText(textColor: .white))
                    .padding()
                
                Spacer()
                
                CircleImage(
                    imagePath: MainActivityString.imagePathOfPerson,
                    baseColor: Color(Colors.primaryYellow.name)
                )
                .scaledToFit()
                .padding()
            }.frame(
                maxWidth: .infinity,
                maxHeight: metrics.size.height * 0.12
            ).background(
                Color(Colors.primaryOrange.name)
            )
        }
    }
}

private struct TabItem {
    let text: String
    
    init(text: String) {
        self.text = text
    }
}


