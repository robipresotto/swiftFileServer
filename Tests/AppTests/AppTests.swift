@testable import App
import XCTVapor

final class AppTests: XCTestCase {
  func testHealthCheck() throws {
    let app = Application(.testing)
    defer { app.shutdown() }
    try configure(app)

    try app.test(.GET, "health", afterResponse: { res in
      XCTAssertEqual(res.status, .ok)
    })
  }
}
