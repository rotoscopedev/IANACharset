# IANACharset

![](https://img.shields.io/badge/License-MIT-informational?style=flat)
![](https://img.shields.io/badge/Unit%20Tests-Passed-success?style=flat)
![](https://img.shields.io/badge/Swift-5.5+-red?style=flat)
![](https://img.shields.io/badge/SPM-Package-red?style=flat)
![](https://img.shields.io/badge/iOS-grey?style=flat&logo=apple&logoColor=white)
![](https://img.shields.io/badge/macOS-grey?style=flat&logo=apple&logoColor=white)

The `IANACharset` package provides the `IANACharset` enum that implements a rich, strongly-typed interface for interacting with [IANA character sets](https://www.iana.org/assignments/character-sets/character-sets.xhtml).

`IANACharset` instances can

- provide information about the charset such as name, preferred MIME name, and aliases;

  ```swift
  let charset: IANACharset = .es
  charset.aliases.forEach {
    ...
  }
  ```

- be converted to and from MIB enum;

  ```swift
  let charset = IANACharset(mibEnum: 3)
  assert(charset == .usASCII)
  assert(charset.mibEnum == 3)
  ```

- be converted from a string, mapping from name, preferred MIME name or alias;

  ```swift
  let charset = IANACharset(string: "korean")
  assert(charset == .ksC5601_1987)
  ```

- be encoded and decoded;
- be initialized from string literals;

  ```swift
  let charset: IANACharset = "UTF-8"
  assert(charset == .utf8)
  ```

- be initialized from integer literals;

  ```swift
  let charset: IANACharset = 3
  assert(charset == .usASCII)
  ```

- be converted to and from the `String.Encoding` type;

  ```swift
  let encoding = String.Encoding(charset: .utf8)
  assert(encoding == .utf8)
  ```
