//
//  CSMainViewControllerViewController.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

final class CSMainViewControllerViewController: UIViewController, ClearNavigationTheme {
  
  // MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var loadingView: UIActivityIndicatorView!
  
  // MARK: - Class properties
  
  // MARK: - Public properties  

  var viewModel: CSMainViewControllerViewModelInterface!
  
  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
    viewModel.viewDidLoad()
  }
  
  // MARK: - Class Configurations  

  private func viewConfiguration() {
    title = viewModel.navTitle
    
    loadingView.isHidden = true
    viewModel.configureTableView(tableView: tableView)
    
    tableView.delegate = self
    tableView.dataSource = self
  }

  // MARK: - UIActions

  // MARK: - Class Methods
  
}

// MARK: - Extensions

extension CSMainViewControllerViewController: CSMainViewControllerViewInterface {
  func reloadData() {
    tableView.reloadData()
  }
  
  func configTableLoading(isHidden: Bool) {
    loadingView.isHidden = isHidden
  }
}

extension CSMainViewControllerViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return viewModel.cellForIndex(index: indexPath, tableView: tableView)
  }
  
  public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    viewModel.tableView(tableView, willDisplay: cell, forItemAt: indexPath)
  }
  
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.selectRow(tableView, didSelectRowAt: indexPath)
  }
}
