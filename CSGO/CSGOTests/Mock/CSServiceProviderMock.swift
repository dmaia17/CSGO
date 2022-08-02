//
//  CSServiceProviderMock.swift
//  CSGOTests
//
//  Created by Daniel Maia dos Passos on 02/08/22.
//

import Foundation

import XCTest
@testable import CSGO

enum SuccessMockType: String {
  case matchSuccess = "MatchesMock"
  case playerSuccess = "PlayersMock"
}

class CSServiceProviderMock<T: Decodable>: CSBaseServiceMock<T> {
  init(mockSuccess: SuccessMockType) {
    super.init(mockSuccessFile: mockSuccess.rawValue)
  }
}

extension CSServiceProviderMock: CSServiceProviderProtocol {
  func getMatches(page: Int, successCallback: @escaping ([CSMatchModel]) -> Void, failureCallback: @escaping () -> Void) {
    if let mock = mockSuccess, let parsedMock = mock as? [CSMatchModel] {
      successCallback(parsedMock)
    } else {
      failureCallback()
    }
  }
  
  func getPlayers(team1: Int, team2: Int, successCallback: @escaping ([CSPlayerModel]) -> Void, failureCallback: @escaping () -> Void) {
    if let mock = mockSuccess, let parsedMock = mock as? [CSPlayerModel] {
      successCallback(parsedMock)
    } else {
      failureCallback()
    }
  }
}
