//
//  CSDetailViewControllerInterfaces.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 29/07/22.
//

import UIKit

enum CSDetailViewControllerNavigationOption { }

protocol CSDetailViewControllerWireframeInterface: WireframeInterface {
  func navigate(to option: CSDetailViewControllerNavigationOption)
}

protocol CSDetailViewControllerViewInterface: ViewInterface { }

protocol CSDetailViewControllerViewModelInterface: ViewModelInterface {
  var navTitle: String { get }
}
