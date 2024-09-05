import Foundation

extension Date {
    public struct CustomRelativeFormatStyle: Codable, Hashable, Sendable {
        public var unitsStyle: Date.RelativeFormatStyle.CustomUnitsStyle
    }
}

extension Date.CustomRelativeFormatStyle: FormatStyle {
    public typealias FormatInput = Date
    public typealias FormatOutput = String
    
    public func format(_ destDate: Date) -> String {
        let timeInterval = Date.now.timeIntervalSince(destDate)

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
        } else if timeInterval < 604800 { // ~ 1w
            let days = Int(timeInterval / 86400)
            return String(localized: "\(days)d", bundle: .module)
        } else { // 1w ~
            return destDate.formatted(date: .numeric, time: .omitted)
        }
    }
}

extension FormatStyle where Self == Date.CustomRelativeFormatStyle {
    public static func relative(
        unitsStyle: Date.RelativeFormatStyle.CustomUnitsStyle,
        capitalizationContext: FormatStyleCapitalizationContext = .unknown
    ) -> Date.CustomRelativeFormatStyle {
        Date.CustomRelativeFormatStyle(
            unitsStyle: unitsStyle
        )
    }
}

extension Date.RelativeFormatStyle.CustomUnitsStyle {
    public static var condensed: Date.RelativeFormatStyle.CustomUnitsStyle { .init(rawValue: #function) }
}

extension Date.RelativeFormatStyle {
    public struct CustomUnitsStyle: Codable, Hashable, Sendable {
        let rawValue: String
    }
}
