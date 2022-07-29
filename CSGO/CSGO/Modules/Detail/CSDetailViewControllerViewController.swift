//
//  CSDetailViewControllerViewController.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 29/07/22.
//

import UIKit

final class CSDetailViewControllerViewController: UIViewController, DefaultNavigationTheme {
  
  // MARK: - Outlets
  
  // MARK: - Class properties
  
  // MARK: - Public properties  

  var viewModel: CSDetailViewControllerViewModelInterface!
  
  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
  }
  
  // MARK: - Class Configurations  

  private func viewConfiguration() {
    title = viewModel.navTitle
  }

  // MARK: - UIActions

  // MARK: - Class Methods
  
}

// MARK: - Extensions

extension CSDetailViewControllerViewController: CSDetailViewControllerViewInterface { }
