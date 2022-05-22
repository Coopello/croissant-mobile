import SwiftUI

struct CircleImage: View {
    private let imagePath: String
    private let baseColor: Color
    
    init(
        imagePath: String,
        baseColor: Color
    ) {
        self.imagePath = imagePath
        self.baseColor = baseColor
    }
    
    var body: some View {
        Image(systemName: imagePath)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(baseColor)
            .clipShape(Circle())
            .aspectRatio(contentMode: .fill)
    }
}
