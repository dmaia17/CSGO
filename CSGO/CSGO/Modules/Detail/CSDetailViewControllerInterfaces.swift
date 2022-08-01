//
//  CSDetailViewControllerInterfaces.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 29/07/22.
//

import UIKit

enum CSDetailViewControllerNavigationOption {
  case showGenericError
}

enum CSDetailFiels {
  case team1Image
  case team1Name
  case team2Image
  case team2Name
  case status
}

protocol CSDetailViewControllerWireframeInterface: WireframeInterface {
  func navigate(to option: CSDetailViewControllerNavigationOption)
}

protocol CSDetailViewControllerViewInterface: ViewInterface {
  func loadFields(field: CSDetailFiels, data: String)
  func reloadData()
}

protocol CSDetailViewControllerViewModelInterface: ViewModelInterface {
  var navTitle: String { get }
  
  func configureTableView(tableView: UITableView)
  func numberOfRowsInSection() -> Int
  func cellForIndex(index: IndexPath, tableView: UITableView) -> UITableViewCell
}
