//
// Created by Kohei Inoue on 2022/04/19.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct BottomTab: View {
    @State var selectedIndex = 0

    let itemDictionary: [(key: Int, value: (String, String))] = [
        0: ("wallet.pass", "募集一覧"),
        1: ("plus.circle.fill", ""),
        2: ("person.circle", "マイページ")
    ].sorted {
        $0.key < $1.key
    }

    var body: some View {
        let imageNames = itemDictionary.map {
            $0.value.0
        }
        let texts = itemDictionary.map {
            $0.value.1
        }

        VStack {
            Spacer()
            HStack {
                ForEach(imageNames.indices) { index in
                    Button(action: {
                        selectedIndex = index
                    }) {
                        Spacer()
                        VStack {
                            Image(systemName: imageNames[index])
                                    .renderingMode(.template)
                                    .foregroundColor(.white)
                            if !texts[index].isEmpty {
                                Text(texts[index])
                                        .foregroundColor(.white)
                            }
                        }
                        Spacer()
                    }.padding()
                }
            }.background(Color.primaryOrange)
        }
    }
}

