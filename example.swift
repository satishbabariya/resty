import Resty

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