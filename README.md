# resty
Simple HTTP Networking Library with Async/Await and Codable.

```swift
let todos: [Todo] = try await FakeAPI.todos.request()
```

[![Language: Swift 5](https://img.shields.io/badge/language-Swift%205-f48041.svg?style=flat-square)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/Resty.svg?style=flat-square)](http://cocoapods.org/pods/Resty)
[![License](https://img.shields.io/cocoapods/l/Resty.svg?style=flat-square)](http://cocoapods.org/pods/Resty)
[![Platform](https://img.shields.io/badge/platforms-iOS%209.0+%20%7C%20macOS%2010.12+%20%7C%20watchOS%203.0+-333333.svg?style=flat-square)](http://cocoapods.org/pods/SwiftyContacts)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg?style=flat-square)](https://github.com/apple/swift-package-manager)


- [Installation](#installation)
- [Get started](#get-started)
- [License](#license)



## Installation

### CocoaPods

To integrate Resty into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Resty'
```

Then, run the following command:

```bash
$ pod install
```

### Swift Package Manager

To use SwiftyContacts as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
dependencies: [
    .package(url: "https://github.com/satishbabariya/Resty.git", .upToNextMajor(from: "1.0.0"))
]
```

## Get started

Import SwiftyContacts into your porject

```swift
import Resty
```

### Request with codable async/await

```swift
let todos: [Todo] = try await FakeAPI.todos.request()
```

### Request with codable

```swift

FakeAPI.todos.request(type: [Todo].self) { result in
     switch result {
        case let .success(todos):
                // Array of [Todo]                
        case let .failure(error):
                // error                
     }     
}

```

### REST API Setup

```swift
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
```

## Author

Satish Babariya, satish.babariya@gmail.com

## License

SwiftyContacts is available under the MIT license. See the LICENSE file for more info.