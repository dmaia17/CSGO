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
  private let wireframe: CSDetailViewControllerWireframeInterface?
  private let service: CSServiceProviderProtocol
  private let match: CSMatchModel
  
  let navTitle = Strings.title
  var firstTeamId: Int = 0
  var secondTeamId: Int = 0
  var firstPlayerList: [CSPlayerModel] = []
  var secondPlayerList: [CSPlayerModel] = []
    
  // MARK: - Lifecycle

  init(wireframe: CSDetailViewControllerWireframeInterface?, view: CSDetailViewControllerViewInterface?, service: CSServiceProviderProtocol, match: CSMatchModel) {
    self.wireframe = wireframe
    self.view = view
    self.match = match
    self.service = service
  }
  
  private func getPlayers(team1: Int, team2: Int) {
    view?.fullScreenLoading(hide: false)
    
    service.getPlayers(team1: team1, team2: team2, successCallback: { [weak self] response in
      self?.view?.fullScreenLoading(hide: true)
      self?.configLists(list: response)
      self?.view?.reloadData()
    }, failureCallback: { [weak self] in
      self?.view?.fullScreenLoading(hide: true)
      self?.wireframe?.navigate(to: .showGenericError)
    })
  }
}

// MARK: - Extensions

extension CSDetailViewControllerViewModel: CSDetailViewControllerViewModelInterface {
  func viewDidLoad() {
    let opponents = getOpponents()
    
    if !opponents.isEmpty {
      let firstOpponent = opponents[0]
      let secondOpponent = opponents[1]
      
      view?.loadFields(field: .team1Image, data: firstOpponent.opponent?.image_url ?? "")
      view?.loadFields(field: .team1Name, data: firstOpponent.opponent?.name ?? "")
      view?.loadFields(field: .team2Image, data: secondOpponent.opponent?.image_url ?? "")
      view?.loadFields(field: .team2Name, data: secondOpponent.opponent?.name ?? "")
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
    
    if !opponents.isEmpty {
      firstTeamId = opponents[0].opponent?.id ?? 0
      secondTeamId = opponents[1].opponent?.id ?? 0
      
      getPlayers(team1: firstTeamId, team2: secondTeamId)
    }
  }
  
  func getOpponents() -> [CSOpponentModel] {
    if let opponents = match.opponents, !opponents.isEmpty, opponents.count > 1 {
      return [opponents[0], opponents[1]]
    } else {
      return []
    }
  }
  
  func configLists(list: [CSPlayerModel]) {
    firstPlayerList = list.filter { $0.current_team?.id == firstTeamId }
    secondPlayerList = list.filter { $0.current_team?.id == secondTeamId }
  }
  
  func configureTableView(tableView: UITableView) {
    let nib = UINib(nibName: "CSDetailViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: CSDetailViewCell.cellIdentifier)
    
    tableView.sizeToFit()
    tableView.contentInsetAdjustmentBehavior = .never
    tableView.rowHeight = 70
    tableView.estimatedRowHeight = 70
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
  }
  
  func numberOfRowsInSection() -> Int {
    return firstPlayerList.count > secondPlayerList.count ? firstPlayerList.count : secondPlayerList.count
  }
  
  func cellForIndex(index: IndexPath, tableView: UITableView) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CSDetailViewCell.cellIdentifier, for: index) as? CSDetailViewCell else {
      return UITableViewCell()
    }
    
    var firstPlayer: CSPlayerModel?
    var secondPlayer: CSPlayerModel?
    
    if firstPlayerList.indices.contains(index.row) {
      firstPlayer = firstPlayerList[index.row]
    }
    
    if secondPlayerList.indices.contains(index.row) {
      secondPlayer = secondPlayerList[index.row]
    }
    
    cell.selectionStyle = .none
    cell.setup(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
    return cell
  }
}
