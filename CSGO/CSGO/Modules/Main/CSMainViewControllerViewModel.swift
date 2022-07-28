//
//  CSMainViewControllerViewModel.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

final class CSMainViewControllerViewModel {

  // MARK: - Enums

  enum Strings {
    static let title = "title page"
  }

  // MARK: - Private properties  

  private weak var view: CSMainViewControllerViewInterface?
  private let wireframe: CSMainViewControllerWireframeInterface
  
  let navTitle = Strings.title
    
  // MARK: - Lifecycle

  init(wireframe: CSMainViewControllerWireframeInterface, view: CSMainViewControllerViewInterface) {
    self.wireframe = wireframe
    self.view = view
  }
}

// MARK: - Extensions

extension CSMainViewControllerViewModel: CSMainViewControllerViewModelInterface { }
