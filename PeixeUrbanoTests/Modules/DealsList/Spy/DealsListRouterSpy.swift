//
//  DealsListRouterSpy.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
@testable import PeixeUrbano

// MARK: Methods of DealsListRouterSpy
class DealsListRouterSpy: DealsListRouterProtocol {
  
  weak var viewController: UIViewController?
  var functionCalled = false
  
  func buildModule(screenType: ScreenType) -> UIViewController {
    return UIViewController()
  }
  
}

// MARK: Methods of DealsListPresenterToRouterProtocol
extension DealsListRouterSpy: DealsListPresenterToRouterProtocol {
  
  func showAlert(message: String) {
    functionCalled = true
  }
  
}


