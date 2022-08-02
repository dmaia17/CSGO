//
//  CSOpponentModel.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 29/07/22.
//

import Foundation

struct CSOpponentModel: Codable {
  var opponent: CSOpponentDataModel?
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.opponent = try container.decodeIfPresent(CSOpponentDataModel.self, forKey: .opponent) ?? nil
  }
}

struct CSOpponentDataModel: Codable {
  var id: Int = 0
  var name: String = ""
  var image_url: String = ""
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
    self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    self.image_url = try container.decodeIfPresent(String.self, forKey: .image_url) ?? ""
  }
}
