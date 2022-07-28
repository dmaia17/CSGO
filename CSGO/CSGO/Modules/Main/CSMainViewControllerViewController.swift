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
  
  // MARK: - Class properties
  
  // MARK: - Public properties  

  var viewModel: CSMainViewControllerViewModelInterface!
  
  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
  }
  
  // MARK: - Class Configurations  

  private func viewConfiguration() {
    viewModel.configureTableView(tableView: tableView)
    
    tableView.delegate = self
    tableView.dataSource = self
    
    reloadData()
  }

  // MARK: - UIActions

  // MARK: - Class Methods
  
}

// MARK: - Extensions

extension CSMainViewControllerViewController: CSMainViewControllerViewInterface {
  func reloadData() {
    tableView.reloadData()
  }
}

extension CSMainViewControllerViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return viewModel.cellForIndex(index: indexPath, tableView: tableView)
  }
}
