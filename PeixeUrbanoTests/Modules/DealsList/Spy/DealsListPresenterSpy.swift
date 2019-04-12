//
//  DealsListPresenterSpy.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import PeixeUrbano

// MARK: Methods of DealsListPresenterSpy
class DealsListPresenterSpy {

  weak var viewController: DealsListPresenterToViewControllerProtocol?
  var interactor: DealsListPresenterToInteractorProtocol?
  var router: DealsListPresenterToRouterProtocol?
  var functionCalled = false
  
}

// MARK: Methods of DealsListViewControllerToPresenterProtocol
extension DealsListPresenterSpy: DealsListViewControllerToPresenterProtocol {
  
  func fetchDeals() {
    functionCalled = true
  }
  
}

// MARK: Methods of DealsListInteractorToPresenter
extension DealsListPresenterSpy: DealsListInteractorToPresenter{
  
  func fetchedDeals(deals: [DealsEntity]) {
    functionCalled = true
  }
  
  func fetchedDealsFail(message: String) {
    functionCalled = true
  }
  
}
