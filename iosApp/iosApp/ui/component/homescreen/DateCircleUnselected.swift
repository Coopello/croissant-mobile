//
// Created by Kohei Inoue on 2022/04/24.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI


struct DateCircleUnselected: View {
    let dateText: String
    init(dateText: String) {
        self.dateText = dateText
    }

    var body: some View {
        ZStack {
            Circle()
                    .stroke(Color(Colors.primaryOrange.name), lineWidth: 2)
                    .foregroundColor(.white)
            Text(dateText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(Colors.primaryOrange.name))
        }
    }
}
