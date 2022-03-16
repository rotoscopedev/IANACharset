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

import Nimble
import XCTest

@testable import IANACharset

final class IANACharsetTests: XCTestCase {
  
  func test_initWithName() {
    let charset = IANACharset(string: "UTF-8")
    expect(charset).toNot(beNil())
    expect(charset) == .utf8
  }
  
  func test_initWithLowercaseName() {
    let charset = IANACharset(string: "utf-8")
    expect(charset).toNot(beNil())
    expect(charset) == .utf8
  }
  
  func test_initWithPreferredMIMEName() {
    let charset = IANACharset(string: "ISO-8859-1")
    expect(charset).toNot(beNil())
    expect(charset) == .iso8859_1_1987
  }
  
  func test_initWithLowercasePreferredMIMEName() {
    let charset = IANACharset(string: "iso-8859-1")
    expect(charset).toNot(beNil())
    expect(charset) == .iso8859_1_1987
  }

  func test_initWithAlias() {
    let charset = IANACharset(string: "ANSI_X3.4-1968")
    expect(charset).toNot(beNil())
    expect(charset) == .usASCII
  }

  func test_initWithLowercaseAlias() {
    let charset = IANACharset(string: "ansi_x3.4-1968")
    expect(charset).toNot(beNil())
    expect(charset) == .usASCII
  }
  
  func test_initWithMIBEnum() {
    let charset = IANACharset(mibEnum: 3)
    expect(charset).toNot(beNil())
    expect(charset) == .usASCII
  }

  func test_initWithInvalidName() {
    let charset = IANACharset(string: "this-is-not-a-valid-charset")
    expect(charset).to(beNil())
  }
  
  func test_initWithInvalidMIBEnum() {
    let charset = IANACharset(mibEnum: 99999)
    expect(charset).to(beNil())
  }

  // MARK: -
  
  func test_initWithStringEncoding() {
    let charset = IANACharset(encoding: .utf8)
    expect(charset).toNot(beNil())
    expect(charset) == .utf8
  }
  
  func test_initStringEncodingWithCharset() {
    let encoding = String.Encoding(charset: .utf8)
    expect(encoding).toNot(beNil())
    expect(encoding) == .utf8
  }
  
  // MARK: -
  
  func test_initWithStringLiteral() {
    let charset: IANACharset = "UTF-8"
    expect(charset) == .utf8
  }
  
  func test_initWithIntegerLiteral() {
    let charset: IANACharset = 3
    expect(charset) == .usASCII
  }
}
