//
//  DealsListInteractor.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of DealsListInteractor
class DealsListInteractor {
  
  weak var presenter: DealsListInteractorToPresenter?
  var worker: DealsListInteractorToWorkerProtocol?
  
}

// MARK: Methods of DealsListPresenterToInteractorProtocol
extension DealsListInteractor: DealsListPresenterToInteractorProtocol {
  
  func fetchDealsCity() {
    worker?.fetchDealsCity()
  }
  
  func fetchDealsTravel() {
    worker?.fetchDealsTravel()
  }
  
  func fetchDealsProducts() {
    worker?.fetchDealsProducts()
  }
  
}

// MARK: Methods of DealsListWorkerToInteractorProtocol
extension DealsListInteractor: DealsListWorkerToInteractorProtocol {
  
  func fetchedDeals(dealsListEntity: DealsListEntity) {
    let deals = dealsListEntity.response.deals.map({ (deal) -> DealsEntity in
      return DealsEntity (
        image: URL(string: deal.dealImage)!,
        title: deal.short_title,
        partner: deal.partner.name,
        price: deal.min_sale_price.currency
      )
    })
    presenter?.fetchedDeals(deals: deals)
  }
  
  func fetchedDealsFail(message: String) {
    presenter?.fetchedDealsFail(message: message)
  }
  
}
