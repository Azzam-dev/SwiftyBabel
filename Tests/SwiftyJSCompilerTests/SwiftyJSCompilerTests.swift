import XCTest
@testable import SwiftyJSCompiler

final class SwiftyJSCompilerTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(try? SwiftyJSCompiler().transpile(code: "1 + 3 * 5"), nil)
    }
    
    func testParserExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(try SwiftyJSCompiler().parse(code: "1 + 3 * 5;"), nil)
    }
    
    func testParserJSXExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(try SwiftyJSCompiler().parse(code: "var el= <title>${product}</title>"), nil)
    }
}
