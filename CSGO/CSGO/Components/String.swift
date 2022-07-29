//
//  String.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 29/07/22.
//

import Foundation

extension String {
  func toDate() -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    
    return formatter.date(from: self)
  }
}
