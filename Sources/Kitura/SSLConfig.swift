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

import SSLService

// MARK: SSLConfig

/**
A struct which allows the creation of an SSLService Configuration using either a "CA Certificate file", a "CA Certificate directory" or a "Certificate Chain File".
### Usage Example: ###
```swift
let sslConfigDir = URL(fileURLWithPath: #file).appendingPathComponent("../SSLConfig")
let certificatePath = sslConfigDir.appendingPathComponent("certificate.pem").standardized.path
let keyPath = sslConfigDir.appendingPathComponent("key.pem").standardized.path
let sslConfig = SSLConfig(withCACertificateDirectory: nil, usingCertificateFile: certificatePath, withKeyFile: keyPath, usingSelfSignedCerts: true)
```
In this example, an instance of "SSLConfig" is initialised by providing the paths to an existing certificate file and the corresponding key file.
*/
public struct SSLConfig {

    // MARK: Properties
    
    /// The SSLService Configuation for this SSLConfig.
    public private(set) var config: SSLService.Configuration

    // MARK: Lifecycle

    #if os(Linux)
    ///
    /// Initialize an SSLService.Configuration instance using a `CA Certificate` file.
    ///
    /// - Parameters:
    ///		- caCertificateFilePath:	Path to the PEM formatted CA certificate file.
    ///		- certificateFilePath:		Path to the PEM formatted certificate file.
    ///		- keyFilePath:				Path to the PEM formatted key file. If nil, `certificateFilePath` will be used.
    ///		- selfSigned:				True if certs are `self-signed`, false otherwise. Defaults to true.
    ///
    ///	- Returns:	New SSLConfig instance.
    ///
    public init(withCACertificateFilePath caCertificateFilePath: String?, usingCertificateFile certificateFilePath: String?, withKeyFile keyFilePath: String? = nil, usingSelfSignedCerts selfSigned: Bool = true, cipherSuite: String? = nil) {

        config = SSLService.Configuration(withCACertificateFilePath: caCertificateFilePath, usingCertificateFile: certificateFilePath, withKeyFile:keyFilePath, usingSelfSignedCerts: selfSigned, cipherSuite: cipherSuite)
    }

    ///
    /// Initialize an SSLService.Configuration instance using a `CA Certificate` directory.
    ///
    ///	*Note:* `caCertificateDirPath` - All certificates in the specified directory **must** be hashed using the `OpenSSL Certificate Tool`.
    ///
    /// - Parameters:
    ///		- caCertificateDirPath:		Path to a directory containing CA certificates. *(see note above)*
    ///		- certificateFilePath:		Path to the PEM formatted certificate file. If nil, `certificateFilePath` will be used.
    ///		- keyFilePath:				Path to the PEM formatted key file (optional). If nil, `certificateFilePath` is used.
    ///		- selfSigned:				True if certs are `self-signed`, false otherwise. Defaults to true.
    ///
    ///	- Returns:	New SSLConfig instance.
    ///
    public init(withCACertificateDirectory caCertificateDirPath: String?, usingCertificateFile certificateFilePath: String?, withKeyFile keyFilePath: String? = nil, usingSelfSignedCerts selfSigned: Bool = true, cipherSuite: String? = nil) {

        config = SSLService.Configuration(withCACertificateDirectory:caCertificateDirPath, usingCertificateFile: certificateFilePath, withKeyFile: keyFilePath, usingSelfSignedCerts: selfSigned, cipherSuite: cipherSuite)
    }
    #endif // os(Linux)

    ///
    /// Initialize an SSLService.Configuration instance using a `Certificate Chain File`.
    ///
    /// *Note:* If using a certificate chain file, the certificates must be in PEM format and must be sorted starting with the subject's certificate (actual client or server certificate), followed by intermediate CA certificates if applicable, and ending at the highest level (root) CA.
    ///
    /// - Parameters:
    ///		- chainFilePath:			Path to the certificate chain file (optional). *(see note above)*
    ///		- password:					Export password for the chain file (optional). This is required if using a certificate chain file.
    ///		- selfSigned:				True if certs are `self-signed`, false otherwise. Defaults to true.
    ///
    ///	- Returns:	New SSLConfig instance.
    ///
    public init(withChainFilePath chainFilePath: String? = nil, withPassword password: String? = nil, usingSelfSignedCerts selfSigned: Bool = true, cipherSuite: String? = nil) {

        config = SSLService.Configuration(withChainFilePath: chainFilePath, withPassword: password, usingSelfSignedCerts: selfSigned, cipherSuite: cipherSuite)
    }
}
