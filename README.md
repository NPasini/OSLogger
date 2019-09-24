# OSLogger

This Package relies on os.log to provide a Logger.

## Getting Started

OSLogger provides several functions that print several information on the Log Console. Each logging functions is intended to be used for Logging some particular events, such as UI Lifecycle events, Network connection related events and so on.

The available functions for logging are:
* uiLog:
```swift
public static func uiLog(message: String, access: LogAccessLevel = LogAccessLevel.private, type: LogType = .debug.self, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
    log(category: .ui, message: message, access: access, type: type, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
}
```

* networkLog:
```swift
public static func networkLog(message: String, access: LogAccessLevel = LogAccessLevel.private, type: LogType = .debug.self, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
    log(category: .network, message: message, access: access, type: type, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
}
```

* dataFlowLog:
```swift
public static func dataFlowLog(message: String, access: LogAccessLevel = LogAccessLevel.private, type: LogType = .debug.self, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
    log(category: .dataFlow, message: message, access: access, type: type, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
}
```

* dependencyInjectionLog:
```swift
public static func dependencyInjectionLog(message: String, access: LogAccessLevel = LogAccessLevel.private, type: LogType = .debug.self, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
    log(category: .dependencyInjection, message: message, access: access, type: type, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
}
```

The information are printed on the Console with the followign format:

```
[LogCategory] [thread: Thread name] [File:code line function] > Log message
```

For all the informations reagrding the LogAccessLevel and the LogType you can refer to the official [Apple documentation](https://developer.apple.com/documentation/os/logging).

### Installation

To integrate the package in your application you need to use Swift Package Manager and add OSLogger as a dependency of your package in Package.swift:

.package(url: "https://github.com/NPasini/OSLogger.git", from: "1.0.0"),

### Example

Suppose you call the logging function in the following way:

```swift
//
//  ViewController.swift
//  test
//
//

import UIKit
import OSLogger

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OSLogger.uiLog(message: "Loaded", access: .public, type: .debug)
    }
}

```

Then you will see on the Console the following message:

```
[ui] [thread: main] [ViewController.swift:14 viewDidLoad()] > Loaded
```

## Author

**Nicolò Pasini**


