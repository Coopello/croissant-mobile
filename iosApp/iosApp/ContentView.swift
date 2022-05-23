import SwiftUI
import shared

struct ContentView: View {
	var body: some View {
        let mockPlan = Plan(
            id: 0,
            shopName: "Maru",
            maxNumberOfPeople: 9,
            minNumberOfPeople: 8,
            proposerId: 0,
            participantIds: [0, 9, 8, 9, 9, 9],
            meetingTime: 1653184751,
            status: Plan.PlanStatus.established,
            meetingPlace: ""
        )
        MyPagePlanCell(
            plan: mockPlan
        )
//        HomeActivity()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
