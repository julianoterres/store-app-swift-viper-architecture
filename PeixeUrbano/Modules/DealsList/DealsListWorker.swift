//
//  DealsListWorker.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of DealsListWorker
class DealsListWorker: DealsListWorkerProtocol {
  
  weak var interactor: DealsListInteractorProtocol?
  var network: NetworkProtocol?
  var api: APIProtocol?
  
  func fetchDeals() {
    guard let url = api?.urlCity()  else {
      self.interactor?.fetchedDealsError(message: "Error load api url")
      return
    }
    network?.request(url: url, method: .get, success: { response in
      do {
        let dealsListEntity = try JSONDecoder().decode(DealsListEntity.self, from: response)
        self.interactor?.fetchedDeals(dealsListEntity: dealsListEntity)
      } catch let error {
        self.interactor?.fetchedDealsError(message: error.localizedDescription)
      }
    }, failure: { error in
      self.interactor?.fetchedDealsError(message: error)
    })
  }
  
}
