import XCTest
@testable import RelativeDateFormat

final class RelativeDateFormatTests: XCTestCase {
    func testFormatter() throws {
        let formatStyle = Date.CustomRelativeFormatStyle(
            unitsStyle: .condensed
        )
        XCTAssertEqual(formatStyle.format(.now), "just now")
        XCTAssertEqual(formatStyle.format(.distantPast), "1/1/1")
        XCTAssertEqual(formatStyle.format(date(from: "20240409")), "4/9/2024")
    }
    
    func testFormatted() {
        XCTAssertEqual(Date.now.formatted(.relative(unitsStyle: .condensed)), "just now")
    }
    
    func date(from yyyymmdd: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.date(from: yyyymmdd)!
    }
}


