//
// Created by Kohei Inoue on 2022/04/21.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct BottomTab: View {
    @State var selectedIndex = 0

    let itemDictionary: [(key: Int, value: (String, String))] = [
        0: ("wallet.pass", "募集一覧"),
        1: ("bottom_tab_button", ""),
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
                            if !texts[index].isEmpty {
                                Image(systemName: imageNames[index])
                                        .renderingMode(.template)
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 28, height: 28)
                                Text(texts[index])
                                        .font(.caption)
                                        .foregroundColor(.white)

                            } else {
                                Image(imageNames[index])
                            }
                        }
                        Spacer()
                    }.padding()
                }
            }.background(Color.primaryOrange)
        }
    }
}
