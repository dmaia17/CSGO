//
//  CSServiceProvider.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import Alamofire

protocol CSServiceProviderProtocol {
  /**
   * Endpoint: https://api.pandascore.co/csgo/matches
   * Type: GET
   */
  func getMatches(page: Int, successCallback: @escaping ([CSMatchModel]) -> Void, failureCallback: @escaping () -> Void)
  
  /**
   * Endpoint: https://api.pandascore.co/csgo/players
   * Type: GET
   */
  func getPlayers(team1: Int, team2: Int, successCallback: @escaping ([CSPlayerModel]) -> Void, failureCallback: @escaping () -> Void)
}

class CSServiceProvider {
  private func createHeader() -> HTTPHeaders {
    return ["Authorization": "Bearer PuGrJQfA8PLjZgTw-135Tq4G0qcRtg6B-sMblLPu4Xdfb1DrjnU", "Accept": "application/json"]
  }
}

extension CSServiceProvider: CSServiceProviderProtocol {
  func getMatches(page: Int, successCallback: @escaping ([CSMatchModel]) -> Void, failureCallback: @escaping () -> Void) {
    AF.request("https://api.pandascore.co/csgo/matches?sort=-status,begin_at&filter[status]=not_started,running&page=\(page)&per_page=50", headers: createHeader())
      .validate()
      .responseDecodable(of: [CSMatchModel].self) { response in
        guard let matchModel = response.value else {
          print(response)
          failureCallback()
          return
        }
        
        print("[CSGO] \(matchModel)")
        successCallback(matchModel)
      }
  }
  
  func getPlayers(team1: Int, team2: Int, successCallback: @escaping ([CSPlayerModel]) -> Void, failureCallback: @escaping () -> Void) {
    AF.request("https://api.pandascore.co/csgo/players?sort=name&filter[team_id]=\(team2),\(team1)", headers: createHeader())
      .validate()
      .responseDecodable(of: [CSPlayerModel].self) { response in
        print("CSGO: \(response)")
        guard let players = response.value else {
          print(response)
          failureCallback()
          return
        }
        
        print("[CSGO] \(players)")
        successCallback(players)
      }
  }
}
