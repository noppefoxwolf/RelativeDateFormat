import XCTest
@testable import RelativeDateFormat

final class RelativeDateFormatTests: XCTestCase {
    func testExample() throws {
        let formatStyle = Date.CustomRelativeFormatStyle(
            unitsStyle: .condensed,
            locale: .autoupdatingCurrent,
            calendar: .autoupdatingCurrent,
            capitalizationContext: .unknown
        )
        XCTAssertEqual(formatStyle.format(.now), "just now")
        XCTAssertEqual(Date.now.formatted(.relative(unitsStyle: .condensed)), "just now")
        XCTAssertEqual(formatStyle.format(.distantPast), "1/01/01")
    }
}

