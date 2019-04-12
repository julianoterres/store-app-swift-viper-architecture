//
//  DealsListProtocols.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit

// MARK: Methods of ViewController to Presenter
protocol DealsListViewControllerToPresenterProtocol: class {
  var viewController: DealsListPresenterToViewControllerProtocol? { get set }
  var router: DealsListPresenterToRouterProtocol? { get set }
  func fetchDeals()
}

// MARK: Methods of Presenter to Interactor
protocol DealsListPresenterToInteractorProtocol: class {
  var presenter: DealsListInteractorToPresenter? { get set }
  func fetchDealsCity()
  func fetchDealsTravel()
  func fetchDealsProducts()
}

// MARK: Methods of Presenter to Router
protocol DealsListPresenterToRouterProtocol: class {
  func showAlert(message: String)
}

// MARK: Methods of Interactor to Worker
protocol DealsListInteractorToWorkerProtocol: class {
  var interactor: DealsListWorkerToInteractorProtocol? { get set }
  func fetchDealsCity()
  func fetchDealsTravel()
  func fetchDealsProducts()
}

// MARK: Methods of Worker to Interactor
protocol DealsListWorkerToInteractorProtocol: class {
  var worker: DealsListInteractorToWorkerProtocol? { get set }
  func fetchedDeals(dealsListEntity: DealsListEntity)
  func fetchedDealsFail(message: String)
}

// MARK: Methods of Interactor to Presenter
protocol DealsListInteractorToPresenter: class {
  var interactor: DealsListPresenterToInteractorProtocol? { get set }
  func fetchedDeals(deals: [DealsEntity])
  func fetchedDealsFail(message: String)
}

// MARK: Methods of Presenter to ViewController
protocol DealsListPresenterToViewControllerProtocol: class {
  func displayFetchedDeals(dealsView: DealsListViewEntity)
}

// MARK: Methods of DealsListRouterProtocol
protocol DealsListRouterProtocol: class {
  var viewController: UIViewController? { get set }
  func buildModule(screenType: ScreenType) -> UIViewController
}

