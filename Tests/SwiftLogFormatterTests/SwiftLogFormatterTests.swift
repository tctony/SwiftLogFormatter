import XCTest
@testable import SwiftLogFormatter

final class SwiftLogFormatterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftLogFormatter().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
