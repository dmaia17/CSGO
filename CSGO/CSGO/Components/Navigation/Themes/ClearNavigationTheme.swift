//
//  ClearNavigationTheme.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

public protocol BSClearNavigationBarTheme: Themeable { }

public extension BSClearNavigationBarTheme {
  
  var iconBackButton: UIImage {
    return UIImage.init(named: "") ?? UIImage()
  }
  
  var iconRightButton: UIImage {
    return UIImage.init(named: "") ?? UIImage()
  }

  var navigationBarBackgroundColor: UIColor {
    return .clear
  }
  
  var navigationBarTintColor: UIColor {
    return .clear
  }
  
  var navigationTitleTextAttributes: [NSAttributedString.Key: Any] {
    return [.foregroundColor: UIColor.white]
  }
  
  var navigationBarStyle: UIBarStyle {
    return .default
  }
  
  var navigationBarTranslucent: Bool {
    return true
  }
  
  var customBackButtonAction: Selector? {
    return nil
  }
  
  var customRightButtonAction: Selector? {
    return nil
  }
  
  var onboardingStepPercentage: Double? {
    return nil
  }
}

