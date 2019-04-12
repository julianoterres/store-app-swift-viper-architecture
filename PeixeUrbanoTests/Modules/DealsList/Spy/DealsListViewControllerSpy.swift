//
//  DealsListViewControllerSpy.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
@testable import PeixeUrbano

// MARK: Methods of DealsListPresenterToViewControllerProtocol
class DealsListViewControllerSpy: DealsListPresenterToViewControllerProtocol {
  
  var functionCalled = false
  var contentPassed: DealsListViewEntity?
  
  func displayFetchedDeals(dealsView: DealsListViewEntity){
    functionCalled = true
    contentPassed = dealsView
  }
  
}
