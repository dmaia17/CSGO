//
//  CSUINavigationController.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import Foundation
import UIKit

public protocol Themeable {
  var navigationBarBackgroundColor: UIColor { get }
  var navigationBarTintColor: UIColor { get }
  var navigationTitleTextAttributes: [NSAttributedString.Key : Any] { get }
  var navigationBarStyle: UIBarStyle { get }
  var navigationBarTranslucent: Bool { get }
}

public class CSUINavigationController: UINavigationController {
  
  // MARK: - Properties
  
  public var statusBarStyle: UIStatusBarStyle = .lightContent {
    didSet {
      self.setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  public var statusBarHidden: Bool = false {
    didSet {
      self.setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Lifecycle
  required convenience init() {
    self.init(navigationBarClass: nil, toolbarClass: nil)
  }
  
  override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
    super.pushViewController(viewController, animated: animated)
    styleViewController(viewController: viewController)
  }
  
  override public func popViewController(animated: Bool) -> UIViewController? {
    let destinationVC = viewControllers.dropLast().last
    let poped = super.popViewController(animated: animated)
    
    styleViewController(viewController: destinationVC)
    
    return poped
  }
  
  override public func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
    let poped = super.popToViewController(viewController, animated: animated)
    styleViewController(viewController: viewController)
    
    return poped
  }
  
  override public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
    super.setViewControllers(viewControllers, animated: animated)
    _ = viewControllers.map({ styleViewController(viewController: $0) })
  }
  
  override public func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
    super.dismiss(animated: flag, completion: completion)
  }
  
  override public func popToRootViewController(animated: Bool) -> [UIViewController]? {
    let poped = super.popToRootViewController(animated: animated)
    _ = viewControllers.map({ styleViewController(viewController: $0) })
    
    return poped
  }
  
  
  private func styleViewController(viewController: UIViewController?) {
    if let vc = viewController as? Themeable {
      switch vc {
      case is DefaultNavigationTheme:
        navigationBar.prefersLargeTitles = false
      case is ClearNavigationTheme:
        navigationBar.prefersLargeTitles = true
      default:
        break
      }
      
      if #available(iOS 15, *) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = vc.navigationTitleTextAttributes
        appearance.backgroundColor = vc.navigationBarBackgroundColor
        appearance.largeTitleTextAttributes = vc.navigationTitleTextAttributes
        appearance.shadowColor = .clear
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
      }
      
      self.setNavigationBarHidden(false, animated: true)
      self.setNeedsStatusBarAppearanceUpdate()
      self.navigationBar.isTranslucent = vc.navigationBarTranslucent
      self.navigationBar.barTintColor = vc.navigationBarBackgroundColor
      self.navigationBar.tintColor = vc.navigationBarTintColor
      self.navigationBar.titleTextAttributes = vc.navigationTitleTextAttributes
      self.navigationBar.topItem?.backButtonTitle = ""
    }
  }
  
  private func customizeBackButton(icon: UIImage) {
    let backArrowImage = icon
    navigationBar.backIndicatorImage = backArrowImage
    navigationBar.backIndicatorTransitionMaskImage = backArrowImage
  }
  
  private func removeNavigationShadow() {
    navigationBar.shadowImage = UIImage()
  }
  
  private func removeBackButtonTitle(from viewController: UIViewController?) {
    let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    viewController?.navigationItem.backBarButtonItem = item
    
    // Remove back button title after iOS 12.1
    viewController?.navigationController?.navigationBar.topItem?.backBarButtonItem = item
  }

}
