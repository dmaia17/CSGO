//
//  CSGameModel.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 29/07/22.
//

import Foundation

struct CSGameModel: Codable {
  var id: Int
  var opponents: [CSOpponentModel] = []
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
    self.opponents = try container.decodeIfPresent([CSOpponentModel].self, forKey: .opponents) ?? []
  }
}
