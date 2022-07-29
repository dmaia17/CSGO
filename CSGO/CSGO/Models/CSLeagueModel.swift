//
//  CSLeagueModel.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import Foundation

struct CSLeagueModel: Codable {
  var name: String = ""
  var image_url: String = ""
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    self.image_url = try container.decodeIfPresent(String.self, forKey: .image_url) ?? ""
  }
}
