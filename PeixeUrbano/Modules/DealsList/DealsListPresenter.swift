//
//  DealsListPresenter.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of DealsListPresenter
class DealsListPresenter: DealsListPresenterProtocol {
  
  weak var viewController: DealsListViewControllerProtocol?
  var interactor: DealsListInteractorProtocol?
  var router: DealsListRouterProtocol?
  
  func fetchDeals() {
    interactor?.fetchDeals()
  }
  
  func fetchedDeals(dealsView: [DealsViewEntity]) {
    viewController?.displayFetchedDeals(dealsView: dealsView)
  }
  
  func fetchedDealsError(message: String) {
    router?.showAlert(message: message)
  }
  
}
