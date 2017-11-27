/*
 * Copyright IBM Corporation 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// MARK HttpVersion

/**
The version of HTTP protocol.
HTTP uses a "major.minor" numbering scheme to indicate versions of the protocol.
### Usage Example: ###
```swift
httpVersion = HTTPVersion(major: serverRequest.httpVersionMajor, minor: serverRequest.httpVersionMinor)
```
 In this example a "HTTPVersion" is initialised from the values taken from httpVersionMajor and httpVersionMinor fields in "serverRequest", which is a `RouterRequest` instance.
*/
public struct HTTPVersion {

    /// The "major" part of the protocol version.
    public let major: UInt16

    /// The "minor" part of the protocol version.
    public let minor: UInt16
}
