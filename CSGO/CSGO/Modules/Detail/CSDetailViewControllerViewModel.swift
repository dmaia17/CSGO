//
//  CSDetailViewControllerViewModel.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 29/07/22.
//

import UIKit

final class CSDetailViewControllerViewModel {

  // MARK: - Enums

  enum Strings {
    static let title = "League + serie"
  }

  // MARK: - Private properties  

  private weak var view: CSDetailViewControllerViewInterface?
  private let wireframe: CSDetailViewControllerWireframeInterface
  private let match: CSMatchModel
  
  let navTitle = Strings.title
    
  // MARK: - Lifecycle

  init(wireframe: CSDetailViewControllerWireframeInterface, view: CSDetailViewControllerViewInterface, match: CSMatchModel) {
    self.wireframe = wireframe
    self.view = view
    self.match = match
  }
}

// MARK: - Extensions

extension CSDetailViewControllerViewModel: CSDetailViewControllerViewModelInterface { }
