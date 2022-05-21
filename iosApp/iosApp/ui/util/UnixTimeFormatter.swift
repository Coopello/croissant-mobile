import Foundation

class UnixTimeFormatter {
    func unixTimeToString(
        unixTime: Int64,
        format: String
    ) -> String {
        let date = Date(timeIntervalSince1970: Double(unixTime))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
