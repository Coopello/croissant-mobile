import SwiftUI

struct CircleText: View {
    private let text: String
    private let baseColor: Color
    private let diameter: CGFloat
    
    init(
        text: String,
        baseColor: Color,
        diameter: CGFloat
    ) {
        self.text = text
        self.baseColor = baseColor
        self.diameter = diameter
    }
    
    var body: some View {
        Text(text)
            .modifier(MediumText(textColor: baseColor))
            .foregroundColor(baseColor)
            .frame(
                width: diameter,
                height: diameter
            )
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(baseColor, lineWidth: 2))
    }
}
