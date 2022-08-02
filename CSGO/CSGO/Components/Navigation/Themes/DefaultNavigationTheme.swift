//
//  DefaultNavigationTheme.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

public protocol DefaultNavigationTheme: Themeable { }

public extension DefaultNavigationTheme {
  
  var navigationBarBackgroundColor: UIColor {
    return .primary
  }
  
  var navigationBarTintColor: UIColor {
    return .white
  }
  
  var navigationTitleTextAttributes: [NSAttributedString.Key: Any] {
    return [.foregroundColor: UIColor.white]
  }
  
  var navigationBarStyle: UIBarStyle {
    return .default
  }
  
  var navigationBarTranslucent: Bool {
    return false
  }
}

