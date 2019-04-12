//
//  DealsListPresenterTests.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import PeixeUrbano

// MARK: Methods of DealsListPresenterTests
class DealsListPresenterTests: QuickSpec {
  
  override func spec() {
    
    var presenter: DealsListPresenter!
    var viewController: DealsListViewControllerSpy!
    var interactor: DealsListInteractorSpy!
    var router: DealsListRouterSpy!
    
    describe("DealsListPresenter") {
      
      beforeEach {
        presenter = DealsListPresenter()
        viewController = DealsListViewControllerSpy()
        interactor = DealsListInteractorSpy()
        router = DealsListRouterSpy()
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.router = router
      }
      
      describe("When presenter execute the method fetchDeals") {
        
        context("and screenType is city") {
          beforeEach {
            presenter.screenType = .city
            presenter.fetchDeals()
          }
          it("should call a method fetchDealsCity at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
        context("and screenType is travel") {
          beforeEach {
            presenter.screenType = .travel
            presenter.fetchDeals()
          }
          it("should call a method fetchDealsTravel at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
        context("and screenType is products") {
          beforeEach {
            presenter.screenType = .products
            presenter.fetchDeals()
          }
          it("should call a method fetchDealsProducts at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
      }
      
      describe("When presenter execute the method fetchedDeals") {
        
        context("and screenType is city") {
          beforeEach {
            let deal = DealsEntity(image: URL(string: "https://google.com")!, title: "Tile Deal", partner: "Partner Name", price: "R$ 1,00")
            presenter.screenType = .city
            presenter.fetchedDeals(deals: [deal])
          }
          it("should call a method displayFetchedDeals at viewcontroller") {
            expect(viewController.functionCalled) == true
            expect(viewController.contentPassed).notTo(beNil())
          }
        }
        
        context("and screenType is travel") {
          beforeEach {
            let deal = DealsEntity(image: URL(string: "https://google.com")!, title: "Tile Deal", partner: "Partner Name", price: "R$ 1,00")
            presenter.screenType = .travel
            presenter.fetchedDeals(deals: [deal])
          }
          it("should call a method displayFetchedDeals at viewcontroller") {
            expect(viewController.functionCalled) == true
            expect(viewController.contentPassed).notTo(beNil())
          }
        }
        
        context("and screenType is products") {
          beforeEach {
            let deal = DealsEntity(image: URL(string: "https://google.com")!, title: "Tile Deal", partner: "Partner Name", price: "R$ 1,00")
            presenter.screenType = .products
            presenter.fetchedDeals(deals: [deal])
          }
          it("should call a method displayFetchedDeals at viewcontroller") {
            expect(viewController.functionCalled) == true
            expect(viewController.contentPassed).notTo(beNil())
          }
        }
        
      }
      
      describe("When presenter execute the method fetchedDealsFail") {
        beforeEach {
          presenter.fetchedDealsFail(message: "Error message")
        }
        it("should call a method showAlert at router") {
          expect(router.functionCalled) == true
          expect(router.messageErrorPassed) == "Error message"
        }
      }
      
    }
    
  }
  
}



