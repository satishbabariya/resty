@testable import Resty
import XCTest

final class RestyTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Resty().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
