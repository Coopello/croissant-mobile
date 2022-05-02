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

    init(
        metrics: GeometryProxy,
        confirmButtonAction: @escaping () -> Void
    ) {
        self.metrics = metrics
        self.confirmButtonAction = confirmButtonAction
    }
    
    var body: some View {
        VStack {
            Group {
                TextWithTitle(
                    title: MainActivityString.destinationShop,
                    description: "Maru"
                )
                Spacer()
            }
            Group {
                TextWithTitle(
                    title: MainActivityString.meetingPlace,
                    description: "オフィスの下"
                )
                Spacer()
            }
            Group {
                TextWithTitle(
                    title: MainActivityString.meetingTime,
                    description: "14:00"
                )
                Spacer()
            }
            Group {
                TextWithTitle(
                    title: MainActivityString.theTimeRequired,
                    description: "1時間(目安)"
                )
                Spacer()
            }
            Group {
                TextWithTitle(
                    title: MainActivityString.peopleNumbers,
                    description: "4人/3人"
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
                .font(.custom(MainActivityString.primaryFontMedium, size: 16))
            Text(description)
                .font(.custom(MainActivityString.primaryFontBold, size: 24))
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
                .font(
                    .custom(
                        MainActivityString.primaryFontBold,
                        size: 20
                    )
                )
                .foregroundColor(.white)
                .frame(
                    width: metrics.size.width * 0.4,
                    height: metrics.size.height * 0.1,
                    alignment: .center
                )
        }.background(Color(Colors.primaryOrange.name))
    }
}
