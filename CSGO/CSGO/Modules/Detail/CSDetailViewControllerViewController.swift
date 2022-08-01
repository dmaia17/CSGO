//
//  CSDetailViewControllerViewController.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 29/07/22.
//

import UIKit
import SGImageCache

final class CSDetailViewControllerViewController: UIViewController, DefaultNavigationTheme {
  
  // MARK: - Outlets
  
  @IBOutlet weak var team1ImageView: UIImageView!
  @IBOutlet weak var team1Label: UILabel!
  @IBOutlet weak var team2ImageView: UIImageView!
  @IBOutlet weak var team2Label: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Class properties
  
  // MARK: - Public properties

  var viewModel: CSDetailViewControllerViewModelInterface!
  
  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
    viewModel.viewDidLoad()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    configBorders()
  }
  
  // MARK: - Class Configurations  

  private func viewConfiguration() {
    title = viewModel.navTitle
  }

  // MARK: - UIActions

  // MARK: - Class Methods
  
  private func configBorders() {
    DispatchQueue.main.async {
      self.team1ImageView.roundCorners(corners: .allCorners, radius: 30)
      self.team2ImageView.roundCorners(corners: .allCorners, radius: 30)
    }
  }
  
}

// MARK: - Extensions

extension CSDetailViewControllerViewController: CSDetailViewControllerViewInterface {
  func loadFields(field: CSDetailFiels, data: String) {
    switch field {
    case .team1Image:
      team1ImageView.setImageForURL(data)
    case .team1Name:
      team1Label.text = data
    case .team2Image:
      team2ImageView.setImageForURL(data)
    case .team2Name:
      team2Label.text = data
    case .status:
      statusLabel.text = data
    }
  }
}
