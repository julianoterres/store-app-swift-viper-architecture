//
//  DealsListViewControllerSpy.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
@testable import PeixeUrbano

// MARK: Methods of DealsListViewControllerSpy
class DealsListViewControllerSpy: UIViewController {
  
  var functionCalled = false
  
}

// MARK: Methods of DealsListPresenterToViewControllerProtocol
extension DealsListViewControllerSpy: DealsListPresenterToViewControllerProtocol {
  
  func displayFetchedDeals(dealsView: DealsListViewEntity){
    functionCalled = true
  }
  
}
