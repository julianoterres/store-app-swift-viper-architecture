//
//  DealsListPresenter.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of DealsListPresenter
class DealsListPresenter {
  
  weak var viewController: DealsListPresenterToViewControllerProtocol?
  var interactor: DealsListPresenterToInteractorProtocol?
  var router: DealsListPresenterToRouterProtocol?
  var screenType: ScreenType?
  
  func getScreenType() -> ScreenType {
    guard let fetchType = screenType else {
      return .city
    }
    return fetchType
  }
  
}

// MARK: Methods of DealsListViewControllerToPresenterProtocol
extension DealsListPresenter: DealsListViewControllerToPresenterProtocol{
  
  func fetchDeals() {
    switch getScreenType() {
    case .city:
      interactor?.fetchDealsCity()
    case .travel:
      interactor?.fetchDealsTravel()
    default:
      interactor?.fetchDealsProducts()
    }
  }
  
}
  
// MARK: Methods of DealsListInteractorToPresenter
extension DealsListPresenter: DealsListInteractorToPresenter{
  
  func fetchedDeals(deals: [DealsEntity]) {
    var titleNavigation = ""
    switch getScreenType() {
    case .city:
      titleNavigation = "Florianópolis"
    case .travel:
      titleNavigation = "Viagens"
    case .products:
      titleNavigation = "Produtos"
    }
    let dealsListView = DealsListViewEntity(
      deals: deals,
      titleNavitagion: titleNavigation
    )
    viewController?.displayFetchedDeals(dealsView: dealsListView)
  }
  
  func fetchedDealsFail(message: String) {
    router?.showAlert(message: message)
  }
  
}
