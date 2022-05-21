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
    
    private let tabItemContents: [TabItemContent] = [
        TabItemContent(
            imagePath: MainActivityString.imagePathOfWallet,
            text: MainActivityString.planList
        ),
        TabItemContent(
            imagePath: MainActivityString.imagePathOfPerson,
            text: MainActivityString.mypage
        )
    ]
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                TabItem(
                    content: TabItemContent(
                        imagePath: MainActivityString.imagePathOfWallet,
                        text: MainActivityString.planList
                    ),
                    index: 0,
                    onClick: { index in
                        selectedIndex = index
                        onClickTab(index)
                    }
                )
                .padding()
                
                Image(Images.bottomTabButton.name).padding()
                
                TabItem(
                    content: TabItemContent(
                        imagePath: MainActivityString.imagePathOfPerson,
                        text: MainActivityString.mypage
                    ),
                    index: 1,
                    onClick: { index in
                        selectedIndex = index
                        onClickTab(index)
                    }
                )
                .padding()
            }.background(Color(Colors.primaryOrange.name))
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: metrics.size.height * 0.1
        )
    }
}

private struct TabItemContent {
    let imagePath: String
    let text: String
    
    init(
        imagePath: String,
        text: String
    ) {
        self.imagePath = imagePath
        self.text = text
    }
}

private struct TabItem: View {
    private let content: TabItemContent
    private let index: Int8
    private let onClick: (Int8) -> Void
    
    init(
        content: TabItemContent,
        index: Int8,
        onClick: @escaping (Int8) -> Void
    ) {
        self.content = content
        self.index = index
        self.onClick = onClick
    }
    
    var body: some View {
        Button(action: {
            onClick(index)
        }) {
            Spacer()
            VStack {
                Image(systemName: content.imagePath)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 28, height: 28)
                Text(content.text)
                    .modifier(ExtraSmallText(textColor: .white))
            }
            Spacer()
        }
    }
}
