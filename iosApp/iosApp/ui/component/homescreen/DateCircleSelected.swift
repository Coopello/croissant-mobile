//
// Created by Kohei Inoue on 2022/04/24.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct DateCircleSelected: View {
    var body: some View {
        ZStack {
            Circle().foregroundColor(Color(Colors.primaryOrange.name))
            Text("7/15")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}
