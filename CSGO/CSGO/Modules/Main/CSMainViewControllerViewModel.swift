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
    static let title = "Partidas"
  }

  // MARK: - Private properties  

  private weak var view: CSMainViewControllerViewInterface?
  private let wireframe: CSMainViewControllerWireframeInterface
  private let service: CSServiceProviderProtocol
  
  private var matchList: [CSMatchModel] = []
  private var currentPage = 1
  private var loaded = false
  let navTitle = Strings.title
    
  // MARK: - Lifecycle

  init(wireframe: CSMainViewControllerWireframeInterface, view: CSMainViewControllerViewInterface, service: CSServiceProviderProtocol) {
    self.wireframe = wireframe
    self.view = view
    self.service = service
  }
  
  private func getMatchesFromService() {
    service.getMatches(page: currentPage, successCallback: { [weak self] response in
      self?.loaded = response.isEmpty
      self?.matchList.append(contentsOf: response)
      self?.view?.reloadData()
      self?.view?.configTableLoading(isHidden: true)
      self?.view?.fullScreenLoading(hide: true)
    }, failureCallback: { [weak self] in
      self?.view?.fullScreenLoading(hide: true)
      self?.wireframe.navigate(to: .showGenericError)
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
    let nib = UINib(nibName: "CSMainViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: CSMainViewCell.cellIdentifier)
    
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
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CSMainViewCell.cellIdentifier, for: index) as? CSMainViewCell else {
      return UITableViewCell()
    }
    
    cell.selectionStyle = .none
    cell.setup(match: matchList[index.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forItemAt indexPath: IndexPath) {
    if indexPath.row == self.matchList.count - 1 && !loaded {
      currentPage += currentPage
      getMatchesFromService()
      view?.configTableLoading(isHidden: false)
    }
  }
  
  func selectRow(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    wireframe.navigate(to: .goToDetail(match: matchList[indexPath.row]))
  }
}
