//
//  DefaultNavigationTheme.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

public protocol DefaultNavigationTheme: Themeable { }

public extension DefaultNavigationTheme {
  var iconBackButton: UIImage {
    return UIImage.init(named: "") ?? UIImage()
  }
  
  var iconRightButton: UIImage {
    return UIImage.init(named: "") ?? UIImage()
  }
  
  var navigationBarBackgroundColor: UIColor {
    return .white
  }
  
  var navigationBarTintColor: UIColor {
    return .blue
  }
  
  var navigationTitleTextAttributes: [NSAttributedString.Key: Any] {
    return [.foregroundColor: UIColor.black]
  }
  
  var navigationBarStyle: UIBarStyle {
    return .black
  }
  
  var navigationBarTranslucent: Bool {
    return false
  }
  
  var customBackButtonAction: Selector? {
    return nil
  }
  
  var customRightButtonAction: Selector? {
    return nil
  }
}

