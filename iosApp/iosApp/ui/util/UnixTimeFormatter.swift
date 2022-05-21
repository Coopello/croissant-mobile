import Foundation

class UnixTimeFormatter {
    func unixTimeToString(
        unixTime: Double,
        format: String
    ) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
