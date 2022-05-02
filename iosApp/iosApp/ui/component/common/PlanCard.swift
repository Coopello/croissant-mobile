//
// Created by Kohei Inoue on 2022/05/02.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

struct PlanCard: View {
   private let plan: Plan

   init(plan: Plan) {
       self.plan = plan
   }
    
    var body: some View {
        HStack {
            TextWithTitle(
                title: MainActivityString.destinationShop,
                description: "Maru"
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
