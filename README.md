# resty
Simple HTTP and REST client library for Swift


- [Get started](#get-started)
- [Installation](#installation)
- [License](#license)


## Get started

Import SwiftyContacts into your porject

```swift
import Resty
```

### Models

```swift

struct Todo: Codable {
    let id: Int
    let title: String
    let completed: Bool
}

```

### Basic Usage

So how do you use this library? Well, it's pretty easy. Just follow this template. First, set up an enum with all of your API targets. Note that you can include information as part of your enum. Let's look at a common example. First we create a new file named FakeAPI.swift:

```swift

enum FakeAPI: Resty {
    case todos
    // other endpoints
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

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Resty into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Resty'

```

Then, run the following command:

```bash
$ pod install
```

### Swift Package Manager

To use SwiftyContacts as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
import PackageDescription

let package = Package(
    name: "Example",
    dependencies: [
        .package(url: "https://github.com/swift-resty/resty.git", from: "1.0.0")
    ]
)
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Resty into your project manually.
