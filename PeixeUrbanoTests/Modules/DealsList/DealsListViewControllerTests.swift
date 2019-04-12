//
//  DealsListViewControllerTests.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import PeixeUrbano

// MARK: Methods of DealsListViewControllerTests
class DealsListViewControllerTests: QuickSpec {
  
  override func spec() {
    
    var viewController: DealsListViewController!
    var presenter: DealsListPresenterSpy!
    var dealsListViewEntity: DealsListViewEntity!
    
    describe("DealsListViewController") {
      
      beforeEach {
        dealsListViewEntity = DealsListViewEntity(deals: [], titleNavitagion: "")
        viewController = DealsListViewController()
        presenter = DealsListPresenterSpy()
        viewController.presenter = presenter
        viewController.dealsListView = dealsListViewEntity
        viewController.viewDidLoad()
      }
      
      describe("When viewController execute the method viewDidLoad") {
        it("then should call a method fetchDeals at presenter") {
          expect(presenter.functionCalled) == true
        }
      }
      
    }
    
  }
  
}
