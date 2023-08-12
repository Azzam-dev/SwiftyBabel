#### node: readme.md was created using Notion ai 😅 (work in progress)

# SwiftyBabel
SwiftyBabel is a Swift wrapper for Babel.js. It provides an easy-to-use interface for running Babel.js on Swift projects.

![SwiftyBabel-logo-v1](https://github.com/Azzam-dev/SwiftyBabel/assets/26893634/c1c576f6-ea9c-4804-a444-76499fe86a67)

## Introduction

SwiftyBabel allows you to use Babel.js with your Swift projects without having to worry about the complexities of setting up and configuring Babel.js. With SwiftyBabel, you can simply write your code in Swift, and SwiftyBabel will take care of the rest.


## Getting Started Guide
### Installation

### Swift Package Manager
SwiftyBabel is also available through [Swift Package Manager](https://github.com/apple/swift-package-manager). 
To install it, simply add the dependency to your Package.Swift file:

```swift
...
dependencies: [
    .package(url: "https://github.com/Azzam-dev/SwiftyBabel.git", from: "1.0.0"),
],
targets: [
    .target( name: "YourTarget", dependencies: ["SwiftyBabel"]),
]
...
```


### Usage

To use SwiftyBabel, simply import the SwiftyBabel module and use the compile function to compile your JavaScript code. For example:

```swift
import SwiftyBabel

let input = "const square = n => n * n;"
let options = BabelOptions(presets: ["env"])
let output = try Babel.compile(input, options: options)

print(output.code) // Output: "var square = function square(n) { return n * n; };"

```


## Contributing

If you'd like to contribute to SwiftyBabel, please feel free to submit a pull request! We welcome contributions from the community.


## Credits

SwiftyBabel was created by Azzam R ALrashed 🇸🇦.


### Get in touch

If you have any questions or feedback, feel free to reach out to me on Twitter.

### License

SwiftyBabel is available under the MIT license. See the LICENSE file for more info.
