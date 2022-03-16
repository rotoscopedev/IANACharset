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

/// Enumeration of [IANA charsets](https://www.iana.org/assignments/character-sets/character-sets.xhtml).
public enum IANACharset: Int {
  case usASCII = 3
  case iso8859_1_1987 = 4
  case iso8859_2_1987 = 5
  case iso8859_3_1988 = 6
  case iso8859_4_1988 = 7
  case iso8859_5_1988 = 8
  case iso8859_6_1987 = 9
  case iso8859_7_1987 = 10
  case iso8859_8_1988 = 11
  case iso8859_9_1989 = 12
  case iso8859_10 = 13
  case iso6937_2Add = 14
  case jisX0201 = 15
  case jisEncoding = 16
  case shiftJIS = 17
  case extendedUNIXCodePackedFormatForJapanese = 18
  case extendedUNIXCodeFixedWidthForJapanese = 19
  case bs4730 = 20
  case sen850200C = 21
  case it = 22
  case es = 23
  case din66003 = 24
  case ns4551_1 = 25
  case nfZ62_010 = 26
  case iso10646UTF1 = 27
  case iso646Basic1983 = 28
  case invariant = 29
  case iso646IRV1983 = 30
  case natsSEFI = 31
  case natsSEFIAdd = 32
  case natsDANO = 33
  case natsDANOAdd = 34
  case sen850200B = 35
  case ksC5601_1987 = 36
  case iso2022KR = 37
  case eucKR = 38
  case iso2022JP = 39
  case iso2022JP2 = 40
  case jisC6220_1969jp = 41
  case jisC6220_1969ro = 42
  case pt = 43
  case greek7Old = 44
  case latinGreek = 45
  case nfZ_62_010_1973 = 46
  case latinGreek1 = 47
  case iso5427 = 48
  case jisC6226_1978 = 49
  case bsViewdata = 50
  case inis = 51
  case inis8 = 52
  case inisCyrillic = 53
  case iso5427_1981 = 54
  case iso5428_1980 = 55
  case gb1988_80 = 56
  case gb2312_80 = 57
  case ns4551_2 = 58
  case videotexSuppl = 59
  case pt2 = 60
  case es2 = 61
  case msz7795_3 = 62
  case jisC6226_1983 = 63
  case greek7 = 64
  case asmo449 = 65
  case isoIR90 = 66
  case jisC6229_1984A = 67
  case jisC6229_1984B = 68
  case jisC6229_1984BAdd = 69
  case jisC6229_1984Hand = 70
  case jisC6229_1984HandAdd = 71
  case jisC6229_1984Kana = 72
  case iso2033_1983 = 73
  case ansiX3_110_1983 = 74
  case t61_7bit = 75
  case t61_8bit = 76
  case ecmaCyrillic = 77
  case csaZ243_4_1985_1 = 78
  case csaZ243_4_1985_2 = 79
  case csaZ243_4_1985_gr = 80
  case iso8859_6E = 81
  case iso8859_6I = 82
  case t101G2 = 83
  case iso8859_8E = 84
  case iso8859_8I = 85
  case csn369103 = 86
  case jusIB1_002 = 87
  case iecP27_1 = 88
  case jusIB1_003Serb = 89
  case jusIB1_003Mac = 90
  case greekCcitt = 91
  case ncNC00_10_81 = 92
  case iso6937_2_25 = 93
  case gost19768_74 = 94
  case iso8859Supp = 95
  case iso10367Box = 96
  case latinLap = 97
  case jisX0212_1990 = 98
  case ds2089 = 99
  case usDK = 100
  case dkUS = 101
  case ksc5636 = 102
  case unicode1_1UTF7 = 103
  case iso2022CN = 104
  case iso2022CNExt = 105
  case utf8 = 106
  case iso8859_13 = 109
  case iso8859_14 = 110
  case iso8859_15 = 111
  case iso8859_16 = 112
  case gbk = 113
  case gb18030 = 114
  case osdEBCDIC_DF04_15 = 115
  case osdEBCDIC_DF03IRV = 116
  case osdEBCDIC_DF04_1 = 117
  case iso11548_1 = 118
  case kz1048 = 119
  case iso10646UCS2 = 1000
  case iso10646UCS4 = 1001
  case iso10646UCSBasic = 1002
  case iso10646UnicodeLatin1 = 1003
  case iso10646J1 = 1004
  case isoUnicodeIBM1261 = 1005
  case isoUnicodeIBM1268 = 1006
  case isoUnicodeIBM1276 = 1007
  case isoUnicodeIBM1264 = 1008
  case isoUnicodeIBM1265 = 1009
  case unicode1_1 = 1010
  case scsu = 1011
  case utf7 = 1012
  case utf16BE = 1013
  case utf16LE = 1014
  case utf16 = 1015
  case cesu8 = 1016
  case utf32 = 1017
  case utf32BE = 1018
  case utf32LE = 1019
  case bocu1 = 1020
  case utf7IMAP = 1021
  case iso8859_1_Windows3_0_Latin1 = 2000
  case iso8859_1_Windows3_1_Latin1 = 2001
  case iso8859_2_WindowsLatin2 = 2002
  case iso8859_9_WindowsLatin5 = 2003
  case hpRoman8 = 2004
  case adobeStandardEncoding = 2005
  case venturaUS = 2006
  case venturaInternational = 2007
  case decMCS = 2008
  case ibm850 = 2009
  case pc8DanishNorwegian = 2012
  case ibm862 = 2013
  case pc8_Turkish = 2014
  case ibmSymbols = 2015
  case ibmThai = 2016
  case hpLegal = 2017
  case hpPiFont = 2018
  case hpMath8 = 2019
  case adobeSymbolEncoding = 2020
  case hpDeskTop = 2021
  case venturaMath = 2022
  case microsoftPublishing = 2023
  case windows31J = 2024
  case gb2312 = 2025
  case big5 = 2026
  case macintosh = 2027
  case ibm037 = 2028
  case ibm038 = 2029
  case ibm273 = 2030
  case ibm274 = 2031
  case ibm275 = 2032
  case ibm277 = 2033
  case ibm278 = 2034
  case ibm280 = 2035
  case ibm281 = 2036
  case ibm284 = 2037
  case ibm285 = 2038
  case ibm290 = 2039
  case ibm297 = 2040
  case ibm420 = 2041
  case ibm423 = 2042
  case ibm424 = 2043
  case ibm437 = 2011
  case ibm500 = 2044
  case ibm851 = 2045
  case ibm852 = 2010
  case ibm855 = 2046
  case ibm857 = 2047
  case ibm860 = 2048
  case ibm861 = 2049
  case ibm863 = 2050
  case ibm864 = 2051
  case ibm865 = 2052
  case ibm868 = 2053
  case ibm869 = 2054
  case ibm870 = 2055
  case ibm871 = 2056
  case ibm880 = 2057
  case ibm891 = 2058
  case ibm903 = 2059
  case ibm904 = 2060
  case ibm905 = 2061
  case ibm918 = 2062
  case ibm1026 = 2063
  case ebcdicAT_DE = 2064
  case ebcdicAT_DE_A = 2065
  case ebcdicCA_FR = 2066
  case ebcdicDK_NO = 2067
  case ebcdicDK_NO_A = 2068
  case ebcdicFI_SE = 2069
  case ebcdicFI_SE_A = 2070
  case ebcdicFR = 2071
  case ebcdicIT = 2072
  case ebcdicPT = 2073
  case ebcdicES = 2074
  case ebcdicES_A = 2075
  case ebcdicES_S = 2076
  case ebcdicUK = 2077
  case ebcdicUS = 2078
  case unknown8BIT = 2079
  case mnemonic = 2080
  case mnem = 2081
  case viscii = 2082
  case viqr = 2083
  case koi8R = 2084
  case hzGB2312 = 2085
  case ibm866 = 2086
  case ibm775 = 2087
  case koi8U = 2088
  case ibm00858 = 2089
  case ibm00924 = 2090
  case ibm01140 = 2091
  case ibm01141 = 2092
  case ibm01142 = 2093
  case ibm01143 = 2094
  case ibm01144 = 2095
  case ibm01145 = 2096
  case ibm01146 = 2097
  case ibm01147 = 2098
  case ibm01148 = 2099
  case ibm01149 = 2100
  case big5HKSCS = 2101
  case ibm1047 = 2102
  case ptcp154 = 2103
  case amiga1251 = 2104
  case koi7Switched = 2105
  case brf = 2106
  case tscii = 2107
  case cp51932 = 2108
  case windows874 = 2109
  case windows1250 = 2250
  case windows1251 = 2251
  case windows1252 = 2252
  case windows1253 = 2253
  case windows1254 = 2254
  case windows1255 = 2255
  case windows1256 = 2256
  case windows1257 = 2257
  case windows1258 = 2258
  case tis620 = 2259
  case cp50220 = 2260
}

// MARK: -

extension IANACharset: Equatable {}
extension IANACharset: Hashable {}
extension IANACharset: CaseIterable {}

// MARK: -

extension IANACharset {
  
  /// Initializes the receiver from the given MIBenum value. Returns `nil` if
  /// `mibEnum` is not a recognized IANA charset.
  public init?(mibEnum: Int) {
    guard let charset = Self(rawValue: mibEnum) else {
      return nil
    }
    self = charset
  }
  
  /// Returns the charset's MIBenum value, which is the same as the `rawValue`.
  public var mibEnum: Int {
    get {
      return rawValue
    }
  }
}

// MARK: -

extension IANACharset: ExpressibleByIntegerLiteral {

  /// Creates an instance initialized to the specified integer value.
  ///
  /// Do not call this initializer directly. Instead, initialize a variable or
  /// constant using an integer literal. For example:
  ///
  ///     let x = 23
  ///
  /// In this example, the assignment to the `x` constant calls this integer
  /// literal initializer behind the scenes.
  ///
  /// - Parameter value: The value to create.
  public init(integerLiteral value: Int) {
    guard let charset = Self(mibEnum: value) else {
      preconditionFailure("\(value) is not a valid MIB enum.")
    }
    self = charset
  }
}
