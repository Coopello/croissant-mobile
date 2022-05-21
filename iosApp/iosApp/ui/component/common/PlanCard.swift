//
// Created by Kohei Inoue on 2022/05/02.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

struct PlanCard: View {
    private let metrics: GeometryProxy
    private let confirmButtonAction: () -> Void
    private let plan: Plan

    init(
        metrics: GeometryProxy,
        plan: Plan,
        confirmButtonAction: @escaping () -> Void
    ) {
        self.metrics = metrics
        self.plan = plan
        self.confirmButtonAction = confirmButtonAction
    }
    
    var body: some View {
        // FIXME: ハードコーディング修正
        VStack {
            Group {
                TextWithTitle(
                    title: MainActivityString.destinationShop,
                    description: plan.shopName
                )
                Spacer()
            }
            Group {
                TextWithTitle(
                    title: MainActivityString.meetingPlace,
                    description: plan.meetingPlace
                )
                Spacer()
            }
            Group {
                TextWithTitle(
                    title: MainActivityString.meetingTime,
                    description: UnixTimeFormatter().unixTimeToString(
                        unixTime: plan.meetingTime,
                        format: MainActivityString.hourAndMinuteFormat
                    )
                )
                Spacer()
            }
            Group {
                TextWithTitle(
                    title: MainActivityString.theTimeRequired,
                    description: plan.shopName
                )
                Spacer()
            }
            Group {
                TextWithTitle(
                    title: MainActivityString.peopleNumbers,
                    description: "\(plan.minNumberOfPeople)人/\(plan.maxNumberOfPeople)人"
                )
                Spacer()
            }
            ConfirmButton(
                text: MainActivityString.participate,
                metrics: metrics,
                action: confirmButtonAction
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
                .modifier(SmallText(textColor: .black))
            Text (description)
                .modifier(LargeText(textColor: .black))
        }
    }
}

private struct ConfirmButton: View {
    private let text: String
    private let metrics: GeometryProxy
    private let action: () -> Void
    
    init(
        text: String,
        metrics: GeometryProxy,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.metrics = metrics
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .modifier(MediumText(textColor: .white))
                .frame(
                    width: metrics.size.width * 0.4,
                    height: metrics.size.height * 0.05,
                    alignment: .center
                )
        }.background(Color(Colors.primaryOrange.name))
    }
}
