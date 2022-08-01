//
//  CSPlayerModel.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 30/07/22.
//

import Foundation

struct CSPlayerModel: Codable {
  var name: String = ""
  var image_url: String = ""
  var slug: String = ""
  var current_team: CSOpponentDataModel?
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    self.image_url = try container.decodeIfPresent(String.self, forKey: .image_url) ?? ""
    self.slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
    self.current_team = try container.decodeIfPresent(CSOpponentDataModel.self, forKey: .current_team) ?? nil
  }
}
