import XCTest
@testable import LogFormatter

final class SwiftLogFormatterTests: XCTestCase {
    func testExample() {
        let formatter = LogDefaultFormatter()
        print(formatter.format(level: .info, message: "hahaha", metadata: [:], file: "file.swift", function: "funcname", line: 10))
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
