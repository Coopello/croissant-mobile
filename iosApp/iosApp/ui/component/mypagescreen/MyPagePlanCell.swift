import SwiftUI
import shared

struct MyPagePlanCell: View {
    private let plan: Plan
    private let unixTimeFormatter = UnixTimeFormatter()
    
    init (plan: Plan) {
        self.plan = plan
    }
    
    var body: some View {
        HStack {
            MyPagePlanCard(plan: plan)
        }
    }
}

private struct MyPagePlanCard: View {
    private let plan: Plan
    private let unixTimeFormatter = UnixTimeFormatter()
    
    init(plan: Plan) {
        self.plan = plan
    }
    
    var body: some View {
        VStack {
            Text(plan.shopName)
                .modifier(LargeText(textColor: .black))
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            
            Text(
                unixTimeFormatter.unixTimeToString(
                    unixTime: Double(plan.meetingTime),
                    format: MainActivityString.hourAndMinuteFormat
                )
            )
            .modifier(MediumText(textColor: .black))
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            
            HStack {
                ForEach(plan.participantIds.indices.prefix(4)) { index in
                    if index < 3 {
                        CircleImage(
                            imagePath: MainActivityString.imagePathOfPerson,
                            baseColor: Color(Colors.primaryYellow.name)
                        )
                    } else {
                        CircleText(
                            text: MainActivityString.howManyOthers(
                                plan.participantIds.count - 3
                            ),
                            baseColor: .black,
                            diameter: 64
                        )
                    }
                }.frame(
                    width: 64,
                    height: 64
                )
            }
            
            
            Text(
                MainActivityString.howManyMorePeopleToTheMinimum(
                    plan.minNumberOfPeople - Int32(plan.participantIds.count)
                )
            )
                .modifier(MediumText(textColor: .black))
                .frame(
                    maxWidth: .infinity,
                    alignment: .trailing
                )
        
        }
        .padding()
        .overlay(
            RoundedRectangle(
                cornerRadius: 5
            ).stroke(
                Color(Colors.primaryGray.name),
                lineWidth: 1
            )
        )
    }
}
