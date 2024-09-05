import Foundation

extension Date {
    public struct CustomRelativeFormatStyle: Codable, Hashable, Sendable {
        public var unitsStyle: Date.RelativeFormatStyle.CustomUnitsStyle
        public var referenceDate: Date
        
        public init(unitsStyle: Date.RelativeFormatStyle.CustomUnitsStyle, relativeTo referenceDate: Date) {
            self.unitsStyle = unitsStyle
            self.referenceDate = referenceDate
        }
    }
}

extension Date.CustomRelativeFormatStyle: FormatStyle {
    public typealias FormatInput = Date
    public typealias FormatOutput = String
    
    public func format(_ destDate: Date) -> String {
        CondensedStyleRelativeDateTimeFormatter().localizedString(for: destDate, relativeTo: referenceDate)
    }
}

extension FormatStyle where Self == Date.CustomRelativeFormatStyle {
    public static func relative(
        unitsStyle: Date.RelativeFormatStyle.CustomUnitsStyle,
        relativeTo referenceDate: Date = .now
    ) -> Date.CustomRelativeFormatStyle {
        Date.CustomRelativeFormatStyle(
            unitsStyle: unitsStyle,
            relativeTo: referenceDate
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
