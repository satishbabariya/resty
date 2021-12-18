@testable import Resty
import XCTest

struct Todo: Codable {
    let id: Int
    let title: String
    let completed: Bool
}

enum FakeAPI: Resty {
    case todos
}

extension FakeAPI {
    var host: String {
        return "https://jsonplaceholder.typicode.com/"
    }

    var path: String {
        return ""
    }

    var endpoint: String {
        switch self {
        case .todos:
            return "todos"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .todos:
            return .get
        }
    }

    var parameters: [String: Any]? {
        return nil
    }

    var headers: [String: String]? {
        return nil
    }
}

final class RestyTests: XCTestCase {
    func testExample() {
        let expectation = XCTestExpectation(description: "JSON Placeholder Test API")

        FakeAPI.todos.request(type: [Todo].self) { result in
            switch result {
            case let .success(todos):
                XCTAssertTrue(!todos.isEmpty)
            case let .failure(error):
                XCTAssertThrowsError(error)
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }

    @available(macOS 12, iOS 15, *)
    func testAsyncExample() async {
        do {
            let todos: [Todo] = try await FakeAPI.todos.request()
            XCTAssertTrue(!todos.isEmpty)
        } catch {
            XCTAssertThrowsError(error)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
