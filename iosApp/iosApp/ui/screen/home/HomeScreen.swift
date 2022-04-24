//
// Created by Kohei Inoue on 2022/04/24.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    var body: some View {
        GeometryReader { metrics in
            VStack {
                HStack {
                    DateCircleSelected(dateText: "7/16")
                    DateCircleUnselected(dateText: "7/17")
                    DateCircleUnselected(dateText: "7/18")
                    DateCircleUnselected(dateText: "7/19")
                    DateCircleUnselected(dateText: "7/20")
                }
                .frame(height: metrics.size.height * 0.15)
                Spacer()
            }
        }
    }
}
