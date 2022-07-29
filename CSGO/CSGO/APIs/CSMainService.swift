//
//  CSMainService.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import Alamofire

protocol CSMainServiceProtocol {
  /**
   * Endpoint: https://api.pandascore.co/csgo/matches
   * Type: GET
   */
  func getMatches(successCallback: @escaping ([CSMatchModel]) -> Void, failureCallback: @escaping () -> Void)
}

class CSMainService {
  private func createHeader() -> HTTPHeaders {
    return ["Authorization": "Bearer PuGrJQfA8PLjZgTw-135Tq4G0qcRtg6B-sMblLPu4Xdfb1DrjnU", "Accept": "application/json"]
  }
}

extension CSMainService: CSMainServiceProtocol {
  func getMatches(successCallback: @escaping ([CSMatchModel]) -> Void, failureCallback: @escaping () -> Void) {
    AF.request("https://api.pandascore.co/csgo/matches?sort=name&page=1&per_page=50", headers: createHeader())
      .validate()
      .responseDecodable(of: [CSMatchModel].self) { response in
        guard let matchModel = response.value else {
          print(response)
          failureCallback()
          return
        }
        
        print(matchModel)
        successCallback(matchModel)
      }
  }
}
