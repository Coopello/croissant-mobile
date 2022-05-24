import SwiftUI
import shared

struct MyPagePlanCell: View {
    private let plan: Plan
    private let metrics: GeometryProxy
    private let unixTimeFormatter = UnixTimeFormatter()
    
    init (
        plan: Plan,
        metrics: GeometryProxy
    ) {
        self.plan = plan
        self.metrics = metrics
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(
                    unixTimeFormatter.unixTimeToString(
                        unixTime: Double(plan.meetingTime),
                        format: MainActivityString.dayOfWeek
                    )
                )
                .modifier(MediumText(textColor: .black))
                
                Text(
                    unixTimeFormatter.unixTimeToString(
                        unixTime: Double(plan.meetingTime),
                        format: MainActivityString.dayOfMonth
                    )
                )
                .modifier(MediumText(textColor: .black))
            }
            .frame(
                maxHeight: .infinity,
                alignment: .top
            )
            MyPagePlanCard(plan: plan)
        }
        .frame(
            height: metrics.size.height * 0.28
        )
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
                cornerRadius: 20
            ).stroke(
                Color(Colors.primaryGray.name),
                lineWidth: 1
            )
        )
    }
}