//
//  DealsListWorker.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of DealsListWorker
class DealsListWorker {
  
  weak var interactor: DealsListWorkerToInteractorProtocol?
  var network: NetworkProtocol?
  var api: APIProtocol?
  
}

// MARK: Methods of DealsListInteractorToWorkerProtocol
extension DealsListWorker: DealsListInteractorToWorkerProtocol {
  
  func fetchDealsCity() {
    guard let url = api?.urlCity()  else {
      self.interactor?.fetchedDealsFail(message: "Error load api url")
      return
    }
    fetchDeals(url: url)
  }
  
  func fetchDealsTravel() {
    guard let url = api?.urlTravels()  else {
      self.interactor?.fetchedDealsFail(message: "Error load api url")
      return
    }
    fetchDeals(url: url)
  }
  
  func fetchDealsProducts() {
    guard let url = api?.urlProducts()  else {
      self.interactor?.fetchedDealsFail(message: "Error load api url")
      return
    }
    fetchDeals(url: url)
  }
  
  func fetchDeals(url: URL) {
    network?.request(url: url, method: .get, success: { response in
      do {
        let dealsListEntity = try JSONDecoder().decode(DealsListEntity.self, from: response)
        self.interactor?.fetchedDeals(dealsListEntity: dealsListEntity)
      } catch let error {
        self.interactor?.fetchedDealsFail(message: error.localizedDescription)
      }
    }, failure: { error in
      self.interactor?.fetchedDealsFail(message: error)
    })
  }
  
}

