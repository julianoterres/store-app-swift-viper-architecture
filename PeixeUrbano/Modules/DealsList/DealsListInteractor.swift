//
//  DealsListInteractor.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of DealsListInteractor
class DealsListInteractor: DealsListInteractorProtocol {
  
  weak var presenter: DealsListPresenterProtocol?
  var worker: DealsListWorkerProtocol?
  
  func fetchDeals() {
    worker?.fetchDeals()
  }
  
  func fetchedDeals(dealsListEntity: DealsListEntity) {
    let deals = dealsListEntity.response.deals.map({ (deal) -> DealsViewEntity in
      return DealsViewEntity (
        image: URL(string: deal.dealImage)!,
        title: deal.short_title,
        partner: deal.partner.name,
        price: deal.min_sale_price.currency
      )
    })
    presenter?.fetchedDeals(dealsView: deals)
  }
  
  func fetchedDealsError(message: String) {
    
  }
  
  
}
