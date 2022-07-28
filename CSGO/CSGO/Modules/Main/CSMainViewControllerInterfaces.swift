//
//  CSMainViewControllerInterfaces.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

enum CSMainViewControllerNavigationOption { }

protocol CSMainViewControllerWireframeInterface: WireframeInterface {
  func navigate(to option: CSMainViewControllerNavigationOption)
}

protocol CSMainViewControllerViewInterface: ViewInterface {
  func reloadData()
}

protocol CSMainViewControllerViewModelInterface: ViewModelInterface {
  func configureTableView(tableView: UITableView)
  func numberOfRowsInSection() -> Int
  func cellForIndex(index: IndexPath, tableView: UITableView) -> UITableViewCell
}
