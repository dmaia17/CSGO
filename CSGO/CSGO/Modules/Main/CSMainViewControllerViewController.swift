//
//  CSMainViewControllerViewController.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

final class CSMainViewControllerViewController: UIViewController {
  
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
  }

  // MARK: - UIActions

  // MARK: - Class Methods
  
}

// MARK: - Extensions

extension CSMainViewControllerViewController: CSMainViewControllerViewInterface { }

extension CSMainViewControllerViewController: ClearNavigationTheme { }
