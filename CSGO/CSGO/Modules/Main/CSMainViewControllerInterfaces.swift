//
//  CSMainViewControllerInterfaces.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

enum CSMainViewControllerNavigationOption {
  case goToDetail(match: CSMatchModel)
}

protocol CSMainViewControllerWireframeInterface: WireframeInterface {
  func navigate(to option: CSMainViewControllerNavigationOption)
}

protocol CSMainViewControllerViewInterface: ViewInterface {
  func reloadData()
  func configTableLoading(isHidden: Bool)
}

protocol CSMainViewControllerViewModelInterface: ViewModelInterface {
  var navTitle: String { get }
  
  func configureTableView(tableView: UITableView)
  func numberOfRowsInSection() -> Int
  func cellForIndex(index: IndexPath, tableView: UITableView) -> UITableViewCell
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forItemAt indexPath: IndexPath)
  func selectRow(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}
