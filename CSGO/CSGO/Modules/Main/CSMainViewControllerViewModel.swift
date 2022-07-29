//
//  CSMainViewControllerViewModel.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

final class CSMainViewControllerViewModel {

  // MARK: - Enums

  enum Strings {
  }

  // MARK: - Private properties  

  private weak var view: CSMainViewControllerViewInterface?
  private let wireframe: CSMainViewControllerWireframeInterface
  private let service: CSMainServiceProtocol
  
  private var matchList: [CSMatchModel] = []
    
  // MARK: - Lifecycle

  init(wireframe: CSMainViewControllerWireframeInterface, view: CSMainViewControllerViewInterface, service: CSMainServiceProtocol) {
    self.wireframe = wireframe
    self.view = view
    self.service = service
  }
  
  private func getMatchesFromService() {
    service.getMatches(successCallback: { [weak self] response in
      self?.matchList = response
      self?.view?.reloadData()
      self?.view?.fullScreenLoading(hide: true)
    }, failureCallback: { [weak self] in
      print("TODO: Show error message")
      self?.view?.fullScreenLoading(hide: true)
    })
  }
}

// MARK: - Extensions

extension CSMainViewControllerViewModel: CSMainViewControllerViewModelInterface {
  func viewDidLoad() {
    view?.fullScreenLoading(hide: false)
     getMatchesFromService()
  }
  
  func configureTableView(tableView: UITableView) {
    let nib = UINib(nibName: "MainViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: MainViewCell.cellIdentifier)
    
    tableView.sizeToFit()
    tableView.contentInsetAdjustmentBehavior = .never
    tableView.rowHeight = 192
    tableView.estimatedRowHeight = 192
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
  }
  
  func numberOfRowsInSection() -> Int {
    return matchList.count
  }
  
  func cellForIndex(index: IndexPath, tableView: UITableView) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.cellIdentifier, for: index) as? MainViewCell else {
      return UITableViewCell()
    }
    
    cell.selectionStyle = .none
    cell.setup(match: matchList[index.row])
    return cell
  }
}
