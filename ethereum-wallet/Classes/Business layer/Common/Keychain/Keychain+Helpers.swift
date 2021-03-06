//  MIT License
//
//  Copyright (c) 2017 Artur Guseinov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

extension Keychain {
  
  enum KeychainKeys: String {
    case jsonKey = "json_key_data"
    case firstEnterDate = "firstEnterDate"
    case firstEnterBlock = "firstEnterBlock"
  }
  
  var isAccountBackuped: Bool {
    return exist(.jsonKey)
  }
  
  var jsonKey: Data? {
    get {
      return getData(key: .jsonKey)
    }
    set {
      setData(newValue, for: .jsonKey)
    }
  }
  
  var firstEnterBlock: Int? {
    get {
      return getInt(key: .firstEnterBlock)
    }
    set {
      setInt(newValue, for: .firstEnterBlock)
    }
  }
  
  func getJsonKey() throws -> Data {
    guard let jsonKey = jsonKey else {
      throw KeychainError.noJsonKey
    }
    return jsonKey
  }
  
  var firstEnterDate: Date? {
    get {
      return getDate(key: .firstEnterDate)
    }
    
    set {
      setDate(newValue, for: .firstEnterDate)
    }
  }
  
}

