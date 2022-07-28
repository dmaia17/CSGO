//
//  CSMainViewControllerInterfaces.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

enum CSMainViewControllerNavigationOption { }

protocol CSMainViewControllerWireframeInterface: WireframeInterface {
  func navigate(to option: CSMainViewControllerNavigationOption)
}

protocol CSMainViewControllerViewInterface: ViewInterface { }

protocol CSMainViewControllerViewModelInterface: ViewModelInterface {
  var navTitle: String { get }
}
