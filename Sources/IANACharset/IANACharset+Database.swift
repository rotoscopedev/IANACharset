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
import SwiftCSV

extension IANACharset {
  
  /// Error raised in response to database parsing errors.
  private enum DatabaseError: Error {
    case invalidFormat
    case unrecognizedCharset(Int)
    case missingCharset(IANACharset)
  }
}

// MARK: -

extension String {
  fileprivate static let name = "Name"
  fileprivate static let mibEnum = "MIBenum"
  fileprivate static let preferredMIMEName = "Preferred MIME Name"
  fileprivate static let aliases = "Aliases"
}

// MARK: -

extension IANACharset {

  /// Internal struct that contains information about a charset.
  private struct Record {
    let name: String
    let mibEnum: Int
    let preferredMIMEName: String?
    let aliases: Set<String>
    
    /// Initializes the receiver from the given CSV row.
    init(from row: [String: String]) throws {
      guard let name = row[.name] else { throw DatabaseError.invalidFormat }
      guard let mibString = row[.mibEnum], let mibEnum = Int(mibString) else { throw DatabaseError.invalidFormat }
      
      self.name = name
      self.mibEnum = mibEnum
      self.preferredMIMEName = row[.preferredMIMEName]
        .flatMap {
          !$0.isEmpty ? $0 : nil
        }
      self.aliases = row[.aliases]
        .map { $0
          .components(separatedBy: "\n")
          .filter { !$0.isEmpty }
          .reduce(into: []) {
            $0.insert($1)
          }
        } ?? []
    }
    
    /// Returns a set that combines the record's name, preferred MIME name
    /// and aliases.
    var allNames: Set<String> {
      get {
        var names: Set<String> = [ name ]
        names.formUnion(aliases)
        
        if let preferred = preferredMIMEName {
          names.insert(preferred)
        }
        return names
      }
    }
  }
}

// MARK: -

extension IANACharset {

  /// Parses the contents of the database file at the given URL.
  private static func parse(contentsOf url: URL) throws -> [Self: Record] {
    return try CSV<Named>(url: url)
      .rows
      .reduce(into: []) {
        $0.append(try Record(from: $1))
      }
      .reduce(into: [:]) {
        guard let charset = Self(rawValue: $1.mibEnum) else {
          throw DatabaseError.unrecognizedCharset($1.mibEnum)
        }
        $0[charset] = $1
      }
  }
  
  /// Validates the contents of the given database.
  private static func validate(_ database: [Self: Record]) throws -> [Self: Record] {
    try Self
      .allCases
      .forEach {
        guard database[$0] != nil else {
          throw DatabaseError.missingCharset($0)
        }
      }
    return database
  }
}

// MARK: -

extension IANACharset {
  
  /// Returns the URL of the database file.
  private static var databaseURL: URL? {
    get {
      return Bundle.module.url(forResource: "character-sets-1", withExtension: "csv")
    }
  }

  /// In-memory mapping of IANA charset database.
  private static let database: [Self: Record] = {
    guard let url = databaseURL else {
      fatalError("IANA charset database not found.")
    }
    do {
      return try validate(try parse(contentsOf: url))
    } catch {
      fatalError("Error caught while parsing IANA charset file: \(error)")
    }
  }()
}

// MARK: -

extension IANACharset {
  
  /// Returns the name of the charset.
  public var name: String {
    get {
      return Self.database[self]!.name
    }
  }
  
  /// Returns the charset's preferred MIME name, or `nil` if the charset does
  /// not have a preferred MIME name.
  public var preferredMIMEName: String? {
    get {
      return Self.database[self]!.preferredMIMEName
    }
  }
  
  /// Returns the charset's preferred name.
  ///
  /// Returns `preferredMIMEName` if available, defaulting to `name` if no
  /// preferred MIME name is defined.
  public var preferredName: String {
    get {
      return preferredMIMEName ?? name
    }
  }
  
  /// Returns the charset's aliases.
  public var aliases: Set<String> {
    get {
      return Self.database[self]!.aliases
    }
  }
  
  /// Returns a set that combines the record's name, preferred MIME name
  /// and aliases.
  public var allNames: Set<String> {
    get {
      return Self.database[self]!.allNames
    }
  }
}

// MARK: -

extension IANACharset {
  
  /// Case-independent map used to look up charsets by name.
  private static let map: [String: Self] = {
    return database.reduce(into: [:]) { map, element in
      element.value
        .allNames
        .map { $0.lowercased() }
        .forEach {
          map[$0] = element.key
        }
    }
  }()
  
  /// Initializes the receiver from the given string, attempting to map from
  /// name, preferred MIME name and aliases.
  public init?(string: String) {
    guard !string.isEmpty else { return nil }
    guard let charset = Self.map[string.lowercased()] else { return nil }
    self = charset
  }
}

// MARK: -

extension IANACharset: ExpressibleByStringLiteral {

  /// Creates an instance initialized with the given string literal. Failure
  /// to map `value` to a charset is considered a programmer error and results
  /// in a run-time error.
  public init(stringLiteral value: StaticString) {
    guard let charset = Self(string: "\(value)") else {
      preconditionFailure("\"\(value)\" is not a valid IANA charset.")
    }
    self = charset
  }
}

// MARK: -

extension IANACharset: CustomStringConvertible {
  
  /// Returns the charset's humanly-readable name.
  public var description: String {
    get {
      return name
    }
  }
}
