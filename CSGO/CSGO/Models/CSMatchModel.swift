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
  var status: MatchStatus
  var begin_at: String
  var games: [CSGameModel]?
  var opponents: [CSOpponentModel]?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
    self.league = try container.decodeIfPresent(CSLeagueModel.self, forKey: .league) ?? nil
    self.status = try container.decodeIfPresent(MatchStatus.self, forKey: .status) ?? .not_started
    self.begin_at = try container.decodeIfPresent(String.self, forKey: .begin_at) ?? ""
    self.games = try container.decodeIfPresent([CSGameModel].self, forKey: .games) ?? nil
    self.opponents = try container.decodeIfPresent([CSOpponentModel].self, forKey: .opponents) ?? nil
  }
}

enum MatchStatus: String, Codable {
  case running = "running"
  case not_started = "not_started"
}
