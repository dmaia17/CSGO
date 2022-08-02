//
//  CSBaseServiceMock.swift
//  CSGOTests
//
//  Created by Daniel Maia dos Passos on 02/08/22.
//

import Foundation

@testable import CSGO

class CSBaseServiceMock<T: Decodable> {
  var mockSuccess: T?
  
  init(mockSuccessFile: String) {
    guard let pathString = Bundle(for: type(of: self)).path(forResource: mockSuccessFile, ofType: "json") else {
      fatalError("\(mockSuccessFile).json not found")
    }

    guard let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue) else {
      fatalError("Unable to convert \(mockSuccessFile) to String")
    }
    
    mockSuccess = T.parse(textData: jsonString as String)
  }
}
