//
//  CSMatchModel.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import Foundation

struct CSMatchModel: Codable {
  var name: String = ""
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
  }
}
