//
// Created by Kohei Inoue on 2022/04/19.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct BottomTab: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.primaryOrange
    }

    var body: some View {
        TabView {
            Text("The First Tab")
                    .tabItem {
                        Image(systemName: "plans")
                        Text("募集一覧")
                                .foregroundColor(.white)
                    }
            Text("The Second Tab")
                    .tabItem {
                        Image(systemName: "plans")
                        Text("募集一覧")
                                .foregroundColor(.white)
                    }
        }
    }
}
