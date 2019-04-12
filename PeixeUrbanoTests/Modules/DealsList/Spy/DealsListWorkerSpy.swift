//
//  DealsListWorkerSpy.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation
@testable import PeixeUrbano

// MARK: Methods of DealsListWorker
class DealsListWorkerSpy {
  
  weak var interactor: DealsListWorkerToInteractorProtocol?
  var network: NetworkProtocol?
  var api: APIProtocol?
  var functionCalled = false
  
}

// MARK: Methods of DealsListInteractorToWorkerProtocol
extension DealsListWorkerSpy: DealsListInteractorToWorkerProtocol {
  
  func fetchDealsCity() {
    functionCalled = true
  }
  
  func fetchDealsTravel() {
    functionCalled = true
  }
  
  func fetchDealsProducts() {
    functionCalled = true
  }
  
  func fetchDeals(url: URL) {
    functionCalled = true
  }
  
}


