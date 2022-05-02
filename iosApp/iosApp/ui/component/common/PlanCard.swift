//
// Created by Kohei Inoue on 2022/05/02.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

struct PlanCard: View {
//   private let plan: Plan
//
//   init(plan: Plan) {
//       self.plan = plan
//   }
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                TextWithTitle(
                    title: MainActivityString.destinationShop,
                    description: "Maru"
                )
                Spacer()
                TextWithTitle(
                    title: MainActivityString.meetingPlace,
                    description: "オフィスの下"
                )
                Spacer()
                TextWithTitle(
                    title: MainActivityString.meetingTime,
                    description: "14:00"
                )
                Spacer()
                TextWithTitle(
                    title: MainActivityString.theTimeRequired,
                    description: "1時間(目安)"
                )
                Spacer()
                TextWithTitle(
                    title: MainActivityString.peopleNumbers,
                    description: "4人/3人"
                )
            }
            .padding()
            .frame(
                width: metrics.size.width * 0.6,
                height: metrics.size.height * 0.6,
                alignment: .center
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        Color(Colors.primaryGray.name),
                        lineWidth: 2
                    )
            )
        }
    }
}

private struct TextWithTitle: View {
    private let title: String
    private let description: String
    
    init(
        title: String,
        description: String
    ) {
        self.title = title
        self.description = description
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.custom(MainActivityString.primaryFontMedium, size: 16))
            Text(description)
                .font(.custom(MainActivityString.primaryFontBold, size: 24))
                .fontWeight(.bold)
                .bold()
        }
    }
}
