import Foundation

/// The protocol used to define the specifications necessary for a `Restly`.
public protocol Resty {
    /// The host, conforming to RFC 1808.
    var host: String { get }

    /// The path, conforming to RFC 1808
    var path: String { get }

    /// API Endpoint
    var endpoint: String { get }

    /// The HTTP method used in the request.
    var method: HTTPMethod { get }

    /// The HTTP request parameters.
    var parameters: [String: Any]? { get }

    /// A dictionary containing all the HTTP header fields
    var headers: [String: String]? { get }
}

/// HTTP Methods
public enum HTTPMethod: String {
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case connect = "CONNECT"
    case options = "OPTIONS"
    case trace = "TRACE"
    case patch = "PATCH"
}

/// Resty Errors
enum RestyError: Error {
    case badURL
}

extension Resty {
    /// The URL of the receiver.
    fileprivate var url: String {
        return host + path + endpoint
    }

    @available(macOS 12, iOS 15, *)
    func request<T: Codable>() async throws -> T {
        guard let url = URL(string: url) else {
            throw RestyError.badURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData

        if let parameters = parameters {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        }

        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }

    func request<T: Codable>(type: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completionHandler(.failure(RestyError.badURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData

        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                completionHandler(.failure(error))
                return
            }
        }

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, _, error -> Void in
            if let error = error {
                completionHandler(.failure(error))
                return
            }

            if let data = data {
                do {
                    completionHandler(.success(try JSONDecoder().decode(type, from: data)))
                } catch {
                    completionHandler(.failure(error))
                    return
                }
            }
        })

        dataTask.resume()
    }
}
