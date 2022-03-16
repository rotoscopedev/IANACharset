//
// MIT License
//
// Copyright (c) 2022 Rotoscope GmbH
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

extension String.Encoding {
  
  /// Initializes the receiver with the given IANA charset. Returns `nil` if
  /// `charset` could not be mapped to string encoding.
  public init?(charset: IANACharset) {
    for name in charset.allNames {
      let encoding = CFStringConvertIANACharSetNameToEncoding(name as CFString)
      if encoding != kCFStringEncodingInvalidId {
        self = Self(rawValue: CFStringConvertEncodingToNSStringEncoding(encoding))
        return
      }
    }
    return nil
  }
}

// MARK: -

extension IANACharset {
  
  /// Initializes the receiver with the given string encoding. Returns `nil` if
  /// `encoding` could not be mapped to an IANA charset.
  public init?(encoding: String.Encoding) {
    let encoding = CFStringConvertNSStringEncodingToEncoding(encoding.rawValue)
    if encoding == kCFStringEncodingInvalidId {
      return nil
    }
    if let name = CFStringConvertEncodingToIANACharSetName(encoding),
       let charset = Self(string: name as String) {
      self = charset
    } else {
      return nil
    }
  }
}
