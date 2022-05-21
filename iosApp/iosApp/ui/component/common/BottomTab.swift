//
// Created by Kohei Inoue on 2022/04/21.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct BottomTab: View {
    private let metrics: GeometryProxy
    private let onClickTab: (Int8) -> Void
    @State private var selectedIndex: Int8 = 0
    
    init(
        metrics: GeometryProxy,
        onClickTab: @escaping (Int8) -> Void
    ) {
        self.metrics = metrics
        self.onClickTab = onClickTab
    }

    let itemDictionary: [(key: Int, value: (String, String))] = [
        0: (MainActivityString.imagePathOfWallet, MainActivityString.planList),
        1: (Images.bottomTabButton.name, String()),
        2: (MainActivityString.imagePathOfPerson, MainActivityString.mypage)
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
                    // FIXME: ここをクリックリスナーに差し替える
                    Button(action: {
                        onClickTab(Int8(index))
                        selectedIndex = Int8(index)
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
                                    .modifier(ExtraSmallText(textColor: .white))

                            } else {
                                Image(imageNames[index])
                            }
                        }
                        Spacer()
                    }.padding()
                }
            }.background(Color(Colors.primaryOrange.name))
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: metrics.size.height * 0.1
        )
    }
}
