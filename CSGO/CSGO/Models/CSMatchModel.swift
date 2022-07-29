//
//  CSMatchModel.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import Foundation

struct CSMatchModel: Codable {
  var id: Int
  var league: CSLeagueModel?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
    self.league = try container.decodeIfPresent(CSLeagueModel.self, forKey: .league) ?? nil
  }
}
