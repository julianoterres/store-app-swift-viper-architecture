//
//  DealsListRouter.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit

// MARK: Methods of DealsListRouter
class DealsListRouter: DealsListRouterProtocol {
  
  weak var viewController: UIViewController?
  
  func createModule() -> DealsListViewController {
    let viewController = DealsListViewController()
    let presenter = DealsListPresenter()
    let interactor = DealsListInteractor()
    let worker = DealsListWorker()
    let router = DealsListRouter()
    let network = Network()
    let api = API()
    viewController.presenter = presenter
    presenter.interactor = interactor
    presenter.router = router
    presenter.viewController = viewController
    interactor.worker = worker
    interactor.presenter = presenter
    worker.interactor = interactor
    worker.network = network
    worker.api = api
    router.viewController = viewController
    return viewController
  }
  
  func showAlert(message: String) {
    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    viewController?.present(alert, animated: true, completion: nil)
  }
  
}
