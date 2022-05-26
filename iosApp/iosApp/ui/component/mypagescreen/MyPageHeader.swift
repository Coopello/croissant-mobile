import SwiftUI
import shared

struct MyPageHeader: View {
    private let user: User
    @Binding var selectedTabIndex: Int
    private let onTabClicked: (Int) -> Void
    
    private let tabList = [
        Tab(
            text: MainActivityString.unformed,
            type: TabType.unFormed
        ),
        Tab(
            text: MainActivityString.formed,
            type: TabType.formed
        ),
        Tab(
            text: MainActivityString.participationHistory,
            type: TabType.participationHistory
        )
    ]
    
    init(
        user: User,
        selectedTabIndex: Binding<Int>,
        onTabClicked: @escaping (Int) -> Void
    ) {
        self.user = user
        self._selectedTabIndex = selectedTabIndex
        self.onTabClicked = onTabClicked
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                HStack {
                    Text(user.name)
                        .modifier(LargeText(textColor: .white))
                        .padding()
                    
                    Spacer()
                    
                    CircleImage(
                        imagePath: MainActivityString.imagePathOfPerson,
                        baseColor: Color(Colors.primaryYellow.name)
                    )
                    .scaledToFit()
                    .padding()
                }.frame(
                    maxWidth: .infinity,
                    maxHeight: metrics.size.height * 0.6,
                    alignment: .top
                )

                TabLayout(
                    tabList: tabList,
                    metrics: metrics,
                    selectedTabIndex: $selectedTabIndex,
                    onTabClicked: { index in
                        onTabClicked(index)
                    }
                )
                .frame(
                    maxWidth: .infinity,
                    maxHeight: metrics.size.height * 0.4,
                    alignment: .bottom
                )
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(
            Color(Colors.primaryOrange.name)
        )
        .shadow(
            color: Color(Colors.primaryGray.name),
            radius: 4,
            x: 0,
            y: 4
        )
    }
}

private enum TabType {
    case formed
    case unFormed
    case participationHistory
}

private struct Tab: Equatable {
    let text: String
    let type: TabType
    let id: Int = UUID().uuidString.hash
    
    init(
        text: String,
        type: TabType
    ) {
        self.text = text
        self.type = type
    }
    
    static func == (lhs: Tab, rhs: Tab) -> Bool {
        return lhs.id == rhs.id
    }
}

private struct TabItem: View {
    private let tab: Tab
    private let metrics: GeometryProxy
    private let onClickTab: () -> Void
    
    init(
        tab: Tab,
        metrics: GeometryProxy,
        onClickTab: @escaping () -> Void
    ) {
        self.tab = tab
        self.metrics = metrics
        self.onClickTab = onClickTab
    }
    
    var body: some View {
        Button(
            action: {
                onClickTab()
            },
            label: {
                Text(tab.text).modifier(MediumText(textColor: .white))
            }
        )
    }
}

private struct TabLayout: View {
    private let tabList: [Tab]
    private let metrics: GeometryProxy
    @Binding var selectedTabIndex: Int
    private let onTabClicked: (Int) -> Void
    
    init(
        tabList: [Tab],
        metrics: GeometryProxy,
        selectedTabIndex: Binding<Int>,
        onTabClicked: @escaping (Int) -> Void
    ) {
        self.tabList = tabList
        self.metrics = metrics
        self._selectedTabIndex = selectedTabIndex
        self.onTabClicked = onTabClicked
    }
    
    var body: some View {
        HStack {
            ForEach(tabList, id: \.id) { tab in
                VStack {
                    let currentIndex = tabList.firstIndex(of: tab)!
                    
                    TabItem(
                        tab: tab,
                        metrics: metrics
                    ) {
                        onTabClicked(currentIndex)
                    }
                    
                    Rectangle()
                        .fill(
                            selectedTabIndex == currentIndex ? .white : .clear
                        )
                        .frame(
                            height: 4
                        )
                }
            }
        }
    }
}


