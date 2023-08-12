#### node: readme.md was created using Notion ai 😅 (work in progress)

# SwiftyBabel
SwiftyBabel is a Swift wrapper for Babel.js. It provides an easy-to-use interface for running Babel.js on Swift projects.

![SwiftyBabel-logo-v1](https://github.com/Azzam-dev/SwiftyBabel/assets/26893634/c1c576f6-ea9c-4804-a444-76499fe86a67)

## Introduction

SwiftyBabel allows you to use Babel.js with your Swift projects without having to worry about the complexities of setting up and configuring Babel.js. With SwiftyBabel, you can simply write your code in Swift, and SwiftyBabel will take care of the rest.


## Getting Started Guide
### Installation
### Swift Package Manager

SwiftyBabel can be installed using the Swift Package Manager. 

### Usage

To use SwiftyBabel, simply import the `SwiftyBabel`:


`
import SwiftyBabel
`

Then, create an instance of SwiftyBabel and call its translate method:

`
  let babel = SwiftyBabel()
  let result = babel.translate(code: "const hello = () => 'Hello, world!'", from: .es6, to: .commonJS)
  print(result.output)
`

This will output the following:

`
"use strict";
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.hello = void 0;
const hello = () => 'Hello, world!';
exports.hello = hello;
`

## Credits

SwiftyBabel was created by Azzam R ALrashed 🇸🇦.


### Get in touch

If you have any questions or feedback, feel free to reach out to me on Twitter.

### License

SwiftyBabel is available under the MIT license. See the LICENSE file for more info.
