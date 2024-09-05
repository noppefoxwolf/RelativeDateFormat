import SwiftUI

extension Text {
    public init(_ date: Date, style: Date.FormatStyle.CustomDateStyle) {
        self.init(date.formatted(.relative(unitsStyle: .condensed, relativeTo: style.referenceDate)))
    }
}

extension Date.FormatStyle {
    public struct CustomDateStyle: Codable, Hashable, Sendable {
        let referenceDate: Date
        
        public static func condensedRelative(to referenceDate: Date) -> CustomDateStyle {
            CustomDateStyle(referenceDate: referenceDate)
        }
    }
}

