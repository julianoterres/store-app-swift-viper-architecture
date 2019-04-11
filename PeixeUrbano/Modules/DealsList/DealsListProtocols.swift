//
//  DealsListProtocols.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit

protocol DealsListViewControllerProtocol: class {
  func displayFetchedDeals(dealsView: [DealsViewEntity])
}

protocol DealsListPresenterProtocol: class {
  func fetchDeals()
  func fetchedDeals(dealsView: [DealsViewEntity])
  func fetchedDealsError(message: String)
}

protocol DealsListInteractorProtocol: class {
  func fetchDeals()
  func fetchedDeals(dealsListEntity: DealsListEntity)
  func fetchedDealsError(message: String)
}

protocol DealsListWorkerProtocol: class {
  func fetchDeals()
}

protocol DealsListRouterProtocol: class {
  var viewController: UIViewController? { get set }
  func createModule() -> DealsListViewController
  func showAlert(message: String)
}
