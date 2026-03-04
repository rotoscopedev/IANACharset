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

import Testing

@testable import IANACharset

@Suite("IANACharset") struct IANACharsetTests {
  
  @Test func initWithName() {
    let charset = IANACharset(string: "UTF-8")
    #expect(charset != nil)
    #expect(charset == .utf8)
  }
  
  @Test func initWithLowercaseName() {
    let charset = IANACharset(string: "utf-8")
    #expect(charset != nil)
    #expect(charset == .utf8)
  }
  
  @Test func initWithPreferredMIMEName() {
    let charset = IANACharset(string: "ISO-8859-1")
    #expect(charset != nil)
    #expect(charset == .iso8859_1_1987)
  }
  
  @Test func initWithLowercasePreferredMIMEName() {
    let charset = IANACharset(string: "iso-8859-1")
    #expect(charset != nil)
    #expect(charset == .iso8859_1_1987)
  }

  @Test func initWithAlias() {
    let charset = IANACharset(string: "ANSI_X3.4-1968")
    #expect(charset != nil)
    #expect(charset == .usASCII)
  }

  @Test func initWithLowercaseAlias() {
    let charset = IANACharset(string: "ansi_x3.4-1968")
    #expect(charset != nil)
    #expect(charset == .usASCII)
  }
  
  @Test func initWithMIBEnum() {
    let charset = IANACharset(mibEnum: 3)
    #expect(charset != nil)
    #expect(charset == .usASCII)
  }

  @Test func initWithInvalidName() {
    let charset = IANACharset(string: "this-is-not-a-valid-charset")
    #expect(charset == nil)
  }
  
  @Test func initWithInvalidMIBEnum() {
    let charset = IANACharset(mibEnum: 99999)
    #expect(charset == nil)
  }

  // MARK: -
  
  @Test func initWithStringEncoding() {
    let charset = IANACharset(encoding: .utf8)
    #expect(charset != nil)
    #expect(charset == .utf8)
  }
  
  @Test func initStringEncodingWithCharset() {
    let encoding = String.Encoding(charset: .utf8)
    #expect(encoding != nil)
    #expect(encoding == .utf8)
  }
  
  // MARK: -
  
  @Test func initWithStringLiteral() {
    let charset: IANACharset = "UTF-8"
    #expect(charset == .utf8)
  }
  
  @Test func initWithIntegerLiteral() {
    let charset: IANACharset = 3
    #expect(charset == .usASCII)
  }
  
  // MARK: -
  
  @Test func preferredMIMEName() {
    let charset: IANACharset = .iso8859_1_1987
    #expect(charset.preferredMIMEName == "ISO-8859-1")
  }
  
  @Test func preferredMIMENameEmpty() {
    let charset: IANACharset = .utf8
    #expect(charset.preferredMIMEName == nil)
  }
  
  @Test func preferredName() {
    #expect(IANACharset.iso8859_1_1987.preferredName == "ISO-8859-1")
    #expect(IANACharset.utf8.preferredName == "UTF-8")
  }
}
