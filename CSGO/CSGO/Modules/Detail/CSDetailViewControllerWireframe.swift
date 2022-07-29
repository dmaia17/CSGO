//
//  CSDetailViewControllerWireframe.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 29/07/22.
//

import UIKit

final class CSDetailViewControllerWireframe: BaseWireframe {
  
  // MARK: - Private properties

  private let moduleViewController = CSDetailViewControllerViewController(nibName: nil, bundle: nil)
  
  // MARK: - Module setup

  func configureModule(with viewController: CSDetailViewControllerViewController, match: CSMatchModel) {
    let viewModel = CSDetailViewControllerViewModel(wireframe: self, view: viewController, match: match)
    
    viewController.viewModel = viewModel
  }
  
  // MARK: - Transitions

  func show(with transition: Transition, animated: Bool = true, match: CSMatchModel) {
    configureModule(with: moduleViewController, match: match)
    show(moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing

}

// MARK: - Extensions

extension CSDetailViewControllerWireframe: CSDetailViewControllerWireframeInterface {
  func navigate(to option: CSDetailViewControllerNavigationOption) {
  }
}
