//
//  BaseWireframe.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import Foundation
import UIKit

protocol WireframeInterface: AnyObject {
  func popToRoot(_ animated: Bool)
  func popToViewController(viewController: UIViewController, animated: Bool)
  func popFromNavigationController(animated: Bool)
  func dismiss(animated: Bool)
}

enum Transition {
  case root
  case push
}

class BaseWireframe {
  weak var navigationController: CSUINavigationController!
  weak var tabBarController: UITabBarController?
  weak private var popGesture: UIGestureRecognizer?
  private var transition = CATransition()
  
  required init(navigationController: CSUINavigationController) {
    self.navigationController = navigationController
    
    if let gesture = self.popGesture {
      self.navigationController!.view.addGestureRecognizer(gesture)
    }
  }
  
  fileprivate func removePopGesture() {
    if navigationController!.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
      self.popGesture = navigationController!.interactivePopGestureRecognizer
      self.navigationController!.view.removeGestureRecognizer(navigationController!.interactivePopGestureRecognizer!)
    }
  }
  
  func show(_ viewController: UIViewController, with transition: Transition, animated: Bool) {
    switch transition {
    case .root:
      navigationController.setViewControllers([viewController], animated: animated)
    case .push:
      self.navigationController.pushViewController(viewController, animated: animated)
      self.removePopGesture()
    }
  }
  
  func showGenericErrorAlert() {
    let dialogMessage = UIAlertController(title: "Atenção!", message: "Ocorreu um erro, tente novamente!", preferredStyle: .alert)
    dialogMessage.addAction(UIAlertAction(title: "Fechar", style: .default, handler: { (action) -> Void in }))
    navigationController.present(dialogMessage, animated: true, completion: nil)
  }
}

extension BaseWireframe: WireframeInterface {
  func popToRoot(_ animated: Bool) {
    _ = navigationController.popToRootViewController(animated: animated)
  }
  
  func popToViewController(viewController: UIViewController, animated: Bool) {
    _ = navigationController.popToViewController(viewController, animated: animated)
  }
  
  func popFromNavigationController(animated: Bool) {
    _ = navigationController.popViewController(animated: animated)
  }
  
  func dismiss(animated: Bool) {
    if navigationController != nil {
      navigationController.dismiss(animated: animated)
    }
  }
}

