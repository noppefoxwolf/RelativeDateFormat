@testable import RelativeDateFormat
import Testing
import Foundation

@Suite
struct RelativeDateFormatTest {
    @Test
    func testFormatter() async throws {
        let formatStyle = Date.CustomRelativeFormatStyle(
            unitsStyle: .condensed,
            relativeTo: .now
        )
        #expect(formatStyle.format(.now) == "just now")
        #expect(formatStyle.format(.distantPast) == "0001/01/01")
        #expect(formatStyle.format(date(from: "20240409")) == "2024/04/09")
    }

    @Test
    func testFormatted() {
        #expect(Date.now.formatted(.relative(unitsStyle: .condensed)) == "just now")
    }

    @Test
    func testRelativeTimeString() {
        let currentDate = Date(timeIntervalSinceReferenceDate: 0)
        let testCases: [(String, TimeInterval)] = [
            // Seconds
            ("just now", -3),
            ("just now", -1),
            ("just now", 0),

            // Minutes
            ("59s", -59),
            ("1m", -60),
            ("1m", -119),
            ("59m", -3540),
            ("1h", -3600),

            // Hours
            ("1h", -3600),
            ("1h", -7199),
            ("23h", -82800),
            ("1d", -86400),

            // Days
            ("1d", -86400),
            ("1d", -172799),
            ("6d", -518400),
            ("7d", -604800),

            // Months
            ("2000/12/02", -2592000),
            ("2000/11/02", -5184000),
            ("2000/12/01", -2678400),

            // Year
            ("2000/01/02", -31536000),
            ("2000/01/01", -31622400),
            ("1991/01/04", -315360000),
        ]

        for (expectedResult, timeInterval) in testCases {
            let date = Date(timeIntervalSinceReferenceDate: timeInterval)
            let result = date.formatted(.relative(unitsStyle: .condensed, relativeTo: currentDate))
            #expect(result == expectedResult)
        }
    }
    
    @Test
    func defaultCalendarSpec() {
        #expect(DateFormatter().calendar.identifier == .gregorian)
    }

    func date(from yyyymmdd: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.date(from: yyyymmdd)!
    }
}

