// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum MainActivityString {
  /// d
  internal static let dayOfMonth = MainActivityString.tr("mainactivity", "day_of_month")
  /// E
  internal static let dayOfWeek = MainActivityString.tr("mainactivity", "day_of_week")
  /// 行くお店
  internal static let destinationShop = MainActivityString.tr("mainactivity", "destination_shop")
  /// 成立
  internal static let formed = MainActivityString.tr("mainactivity", "formed")
  /// h:mm
  internal static let hourAndMinuteFormat = MainActivityString.tr("mainactivity", "hour_and_minute_format")
  /// 最低人数まであと%@人
  internal static func howManyMorePeopleToTheMinimum(_ p1: Any) -> String {
    return MainActivityString.tr("mainactivity", "how_many_more_people_to_the_minimum", String(describing: p1))
  }
  /// 他%@人
  internal static func howManyOthers(_ p1: Any) -> String {
    return MainActivityString.tr("mainactivity", "how_many_others", String(describing: p1))
  }
  /// person.circle
  internal static let imagePathOfPerson = MainActivityString.tr("mainactivity", "image_path_of_person")
  /// wallet.pass
  internal static let imagePathOfWallet = MainActivityString.tr("mainactivity", "image_path_of_wallet")
  /// 集合場所
  internal static let meetingPlace = MainActivityString.tr("mainactivity", "meeting_place")
  /// 集合時間
  internal static let meetingTime = MainActivityString.tr("mainactivity", "meeting_time")
  /// M/d
  internal static let monthAndDay = MainActivityString.tr("mainactivity", "month_and_day")
  /// マイページ
  internal static let mypage = MainActivityString.tr("mainactivity", "mypage")
  /// 参加する
  internal static let participate = MainActivityString.tr("mainactivity", "participate")
  /// 参加履歴
  internal static let participationHistory = MainActivityString.tr("mainactivity", "participation_history")
  /// 最低人数/最高人数
  internal static let peopleNumbers = MainActivityString.tr("mainactivity", "people_numbers")
  /// 募集一覧
  internal static let planList = MainActivityString.tr("mainactivity", "plan_list")
  /// MPLUS1p-Black
  internal static let primaryFontBlack = MainActivityString.tr("mainactivity", "primary_font_black")
  /// MPLUS1p-Bold
  internal static let primaryFontBold = MainActivityString.tr("mainactivity", "primary_font_bold")
  /// MPLUS1p-ExtraBold
  internal static let primaryFontExtraBold = MainActivityString.tr("mainactivity", "primary_font_extra_bold")
  /// MPLUS1p-Light
  internal static let primaryFontLight = MainActivityString.tr("mainactivity", "primary_font_light")
  /// MPLUS1p-Medium
  internal static let primaryFontMedium = MainActivityString.tr("mainactivity", "primary_font_medium")
  /// MPLUS1p-Regular
  internal static let primaryFontRegular = MainActivityString.tr("mainactivity", "primary_font_regular")
  /// 所要時間
  internal static let theTimeRequired = MainActivityString.tr("mainactivity", "the_time_required")
  /// 未成立
  internal static let unformed = MainActivityString.tr("mainactivity", "unformed")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension MainActivityString {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
