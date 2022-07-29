//
//  CSMainViewControllerWireframe.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

final class CSMainViewControllerWireframe: BaseWireframe {
  
  // MARK: - Private properties

  private let moduleViewController = CSMainViewControllerViewController(nibName: nil, bundle: nil)
  
  // MARK: - Module setup

  func configureModule(with viewController: CSMainViewControllerViewController) {
    let viewModel = CSMainViewControllerViewModel(wireframe: self, view: viewController, service: CSMainService())
    
    viewController.viewModel = viewModel
  }
  
  // MARK: - Transitions

  func show(with transition: Transition, animated: Bool = true) {
    configureModule(with: moduleViewController)
    show(moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing

}

// MARK: - Extensions

extension CSMainViewControllerWireframe: CSMainViewControllerWireframeInterface {
  func navigate(to option: CSMainViewControllerNavigationOption) {
    // switch option {
    // case <#pattern#>:
    //   <#code#>      
    // }
  }
}
