//
//  DealsListInteractorSpy.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import PeixeUrbano

// MARK: Methods of DealsListInteractorSpy
class DealsListInteractorSpy {
  
  weak var presenter: DealsListInteractorToPresenter?
  var worker: DealsListInteractorToWorkerProtocol?
  var functionCalled = false
  
}

// MARK: Methods of DealsListPresenterToInteractorProtocol
extension DealsListInteractorSpy: DealsListPresenterToInteractorProtocol {
  
  func fetchDealsCity() {
    functionCalled = true
  }
  
  func fetchDealsTravel() {
    functionCalled = true
  }
  
  func fetchDealsProducts() {
    functionCalled = true
  }
  
}

// MARK: Methods of DealsListWorkerToInteractorProtocol
extension DealsListInteractorSpy: DealsListWorkerToInteractorProtocol {
  
  func fetchedDeals(dealsListEntity: DealsListEntity) {
    functionCalled = true
  }
  
  func fetchedDealsFail(message: String) {
    functionCalled = true
  }
  
}

