# CoopeLunch

ランチを通じて、チームのコミュニケーションを生み出すアプリ

## アーキテクチャ

- Repository 層から Entity 層までを KMM で共通化した。
- ViewModel / Reactor を共通化しても、 iOS / Android で wrapper クラスを作成する必要があるため、 View 層（ ViewModel, View ）は iOS / Android それぞれで実装した。

<img src="https://user-images.githubusercontent.com/49048577/163720296-3bc2790c-5338-4b4c-ba6c-dca46e69784b.png" width="600dp" />


## 開発規則

### ブランチ戦略

GitHub flow

### コミット規則

- feat: 新しい機能
- fix: バグの修正
- docs: ドキュメントのみの変更
- style: 空白、フォーマット、セミコロン追加など
- refactor: 仕様に影響がないコード改善(リファクタ)
- perf: パフォーマンス向上関連
- test: テスト関連
- chore: ビルド、補助ツール、ライブラリ関連


## 画面構成

Screen > Section > ...

- Screen に ViewModel を持たせる(親 Fragment )
- Section (子 Fragment ) 

### UIのディレクトリ構造


```
   ui
    ├── component
    │   ├── common
    │   ├── home
    │   │   ├── FormedPlanSection.kt
    │   │   └── UnformedPlanSection.kt
    │   └── mypage
    │       ├── FormedPlanSection.kt
    │       ├── PlanHistorySection.kt
    │       └── UnformedPlanSection.kt
    └── screen
        ├── home
        │   ├── HomeScreen.kt
        │   └── HomeScreenViewModel.kt
        └── mypage
            ├── MypageScreen.kt
            └── MypageScreenViewModel.kt
```


