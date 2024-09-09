import Foundation

public final class CondensedStyleRelativeDateTimeFormatter: DateFormatter, @unchecked Sendable {
    public func localizedString(
        for date: Date,
        relativeTo referenceDate: Date
    ) -> String {
        let timeInterval = referenceDate.timeIntervalSince(date)

        if timeInterval < 5 { // ~ 5s
            return String(localized: "just now", bundle: .module)
        } else if timeInterval < 60 { // ~ 1m
            let seconds = Int(timeInterval)
            return String(localized: "\(seconds)s", bundle: .module)
        } else if timeInterval < 3600 { // ~ 1h
            let minutes = Int(timeInterval / 60)
            return String(localized: "\(minutes)m", bundle: .module)
        } else if timeInterval < 86400 { // ~ 1d
            let hours = Int(timeInterval / 3600)
            return String(localized: "\(hours)h", bundle: .module)
        } else if timeInterval < 2592000 { // ~ 1M
            let days = Int(timeInterval / 86400)
            return String(localized: "\(days)d", bundle: .module)
        } else { // 1M ~
            let absoluteFormatter = DateFormatter()
            absoluteFormatter.dateFormat = "yyyy/MM/dd"
            return absoluteFormatter.string(from: date)
            
            // numericだと1/1/2000のように0が省略される
            // return date.formatted(date: .numeric, time: .omitted)
        }
    }
}
