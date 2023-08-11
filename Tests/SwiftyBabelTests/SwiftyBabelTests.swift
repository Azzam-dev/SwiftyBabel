import XCTest
@testable import SwiftyBabel

final class SwiftyBabelTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(try? SwiftyBabel().transpile(code: "1 + 3 * 5"), nil)
    }
    
    func testParserExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(try SwiftyBabel().parse(code: "1 + 3 * 5;"), nil)
    }
}
