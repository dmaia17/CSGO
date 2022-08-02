//
//  CSGODetailTests.swift
//  CSGOTests
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import XCTest
@testable import CSGO

class CSGODetailTests: XCTestCase {
  
  private var match: CSMatchModel = CSMatchModel.init()
  private var service: CSServiceProviderProtocol?
  private var viewModel: CSDetailViewControllerViewModelInterface?
  
  private func configure() {
    service = configureProvider([CSPlayerModel].self, mockSuccess: .playerSuccess)
    match = createMatchModel()
    viewModel = CSDetailViewControllerViewModel(wireframe: nil, view: nil, service: service!, match: match)
  }
  
  private func configureProvider<T: Decodable>(_: T.Type, mockSuccess: SuccessMockType) -> CSServiceProviderProtocol {
    return CSServiceProviderMock<T>(mockSuccess: mockSuccess)
  }
  
  private func createMatchModel() -> CSMatchModel {
    var opponentData = CSOpponentDataModel.init()
    opponentData.id = 1
    var opponent = CSOpponentModel.init()
    opponent.opponent = opponentData
    
    var opponentData2 = CSOpponentDataModel.init()
    opponentData2.id = 2
    var opponent2 = CSOpponentModel.init()
    opponent2.opponent = opponentData2
    
    var match = CSMatchModel.init()
    match.id = 1
    match.opponents = [opponent, opponent2]
    
    return match
  }
  
  func testOpponents() {
    configure()
    
    let opponents = viewModel?.getOpponents() ?? []
    XCTAssertTrue(opponents.count == 2)
  }
  
  func testFirstPlayerCounterList() {
    configure()
    let opponents = viewModel?.getOpponents() ?? []
    
    if !opponents.isEmpty, let firstTeam = opponents[0].opponent?.id, let secondTeam = opponents[1].opponent?.id {
      service?.getPlayers(team1: firstTeam, team2: secondTeam, successCallback: { [weak self] response in
        self?.viewModel?.firstTeamId = firstTeam
        self?.viewModel?.configLists(list: response)
      }, failureCallback: {
        XCTFail("Failure - Couldn't get data")
      })

      XCTAssertTrue(viewModel?.firstPlayerList.count == 2)
      
    } else {
      XCTFail("Failure - Couldn't get data")
    }
  }
  
  func testSecondPlayerCounterList() {
    configure()
    let opponents = viewModel?.getOpponents() ?? []
    
    if !opponents.isEmpty, let firstTeam = opponents[0].opponent?.id, let secondTeam = opponents[1].opponent?.id {
      service?.getPlayers(team1: firstTeam, team2: secondTeam, successCallback: { [weak self] response in
        self?.viewModel?.secondTeamId = secondTeam
        self?.viewModel?.configLists(list: response)
      }, failureCallback: {
        XCTFail("Failure - Couldn't get data")
      })
      
      XCTAssertTrue(viewModel?.secondPlayerList.count == 2)
      
    } else {
      XCTFail("Failure - Couldn't get data")
    }
  }
}
