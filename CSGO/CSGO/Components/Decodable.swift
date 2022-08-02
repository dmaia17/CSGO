//
//  Decodable.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 02/08/22.
//

import Foundation

extension Decodable {
  static func parse(textData: String) -> Self? {
    do {
      guard let jsonData = textData.data(using: String.Encoding.utf8, allowLossyConversion: false) else {
        return nil
      }
      
      let result = try JSONDecoder().decode(self, from: jsonData)
      return result
    } catch let ex {
      print("parse error: \(ex)")
      return nil
    }
  }
}
