//
//  CSDetailViewControllerViewModel.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 29/07/22.
//

import UIKit

final class CSDetailViewControllerViewModel {

  // MARK: - Enums

  enum Strings {
    static let title = "League + serie"
    static let running = "AGORA"
    static let today = "HOJE"
    static let timeFormat = "%@, %@"
  }

  // MARK: - Private properties  

  private weak var view: CSDetailViewControllerViewInterface?
  private let wireframe: CSDetailViewControllerWireframeInterface
  private let service: CSServiceProviderProtocol
  private let match: CSMatchModel
  
  let navTitle = Strings.title
  private var team1Id: Int = 0
  private var team2Id: Int = 0
  private var team1List: [CSPlayerModel] = []
  private var team2List: [CSPlayerModel] = []
    
  // MARK: - Lifecycle

  init(wireframe: CSDetailViewControllerWireframeInterface, view: CSDetailViewControllerViewInterface, service: CSServiceProviderProtocol, match: CSMatchModel) {
    self.wireframe = wireframe
    self.view = view
    self.match = match
    self.service = service
  }
  
  private func getPlayers(team1: Int, team2: Int) {
    service.getPlayers(team1: team1, team2: team2, successCallback: { [weak self] response in
      self?.configLists(list: response)
    }, failureCallback: {
      print("ERROR")
    })
  }
  
  private func configLists(list: [CSPlayerModel]) {
    team1List = list.filter { $0.current_team?.id == team1Id }
    team2List = list.filter { $0.current_team?.id == team2Id }
  }
}

// MARK: - Extensions

extension CSDetailViewControllerViewModel: CSDetailViewControllerViewModelInterface {
  func viewDidLoad() {
    var firstOpponent: CSOpponentModel?
    var secondOpponent: CSOpponentModel?
    
    if let opponents = match.opponents, !opponents.isEmpty, opponents.count > 1 {
      firstOpponent = opponents[0]
      secondOpponent = opponents[1]
      
      view?.loadFields(field: .team1Image, data: firstOpponent?.opponent?.image_url ?? "")
      view?.loadFields(field: .team1Name, data: firstOpponent?.opponent?.name ?? "")
      view?.loadFields(field: .team2Image, data: secondOpponent?.opponent?.image_url ?? "")
      view?.loadFields(field: .team2Name, data: secondOpponent?.opponent?.name ?? "")
    }
    
    if match.status == .running {
      view?.loadFields(field: .status, data: Strings.running)
    } else {
      let date = match.begin_at.toDate() ?? .now
      
      if date.isInToday {
        view?.loadFields(field: .status, data: String(format: Strings.timeFormat, Strings.today, date.hourAndMin()))
      } else if date.isMoreThanSevenDay {
        view?.loadFields(field: .status, data: String(format: Strings.timeFormat, date.dayAndMonth(), date.hourAndMin()))
      } else {
        view?.loadFields(field: .status, data: String(format: Strings.timeFormat, date.dayName().uppercased(), date.hourAndMin()))
      }
    }
    
    if let firstOpponent = firstOpponent, let secondOpponent = secondOpponent {
      team1Id = firstOpponent.opponent?.id ?? 0
      team2Id = secondOpponent.opponent?.id ?? 0
      
      getPlayers(team1: team1Id, team2: team2Id)
    }
  }
}
