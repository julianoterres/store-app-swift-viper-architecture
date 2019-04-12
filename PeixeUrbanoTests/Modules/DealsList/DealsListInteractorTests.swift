//
//  DealsListInteractorTests.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import PeixeUrbano

// MARK: Methods of DealsListInteractorTests
class DealsListInteractorTests: QuickSpec {
  
  override func spec() {
    
    var interactor: DealsListInteractor!
    var presenter: DealsListPresenterSpy!
    var worker: DealsListWorkerSpy!
    
    describe("DealsListInteractor") {
      
      beforeEach {
        interactor = DealsListInteractor()
        presenter = DealsListPresenterSpy()
        worker = DealsListWorkerSpy()
        interactor.presenter = presenter
        interactor.worker = worker
      }
      
      describe("When interactor execute the method fetchDealsCity") {
        beforeEach {
          interactor.fetchDealsCity()
        }
        it("should call a method fetchDealsCity at worker") {
          expect(worker.functionCalled) == true
        }
      }
      
      describe("When interactor execute the method fetchDealsTravel") {
        beforeEach {
          interactor.fetchDealsTravel()
        }
        it("should call a method fetchDealsTravel at worker") {
          expect(worker.functionCalled) == true
        }
      }
      
      describe("When interactor execute the method fetchDealsProducts") {
        beforeEach {
          interactor.fetchDealsProducts()
        }
        it("should call a method fetchDealsProducts at worker") {
          expect(worker.functionCalled) == true
        }
      }
      
      describe("When interactor execute the method fetchedDeals") {
        beforeEach {
          do {
            let path = Bundle.main.path(forResource: "DealsListRequestSpy", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let dealsListEntity = try JSONDecoder().decode(DealsListEntity.self, from: data)
            interactor.fetchedDeals(dealsListEntity: dealsListEntity)
          } catch {
            fail("Failed load DealsListRequestSpy")
          }
        }
        it("should call a method fetchedDeals at presenter") {
          expect(presenter.functionCalled) == true
          expect(presenter.contentPassed).notTo(beNil())
          expect(presenter.contentPassed?.count) == 1
        }
      }
      
      describe("When interactor execute the method fetchedDealsFail") {
        beforeEach {
          interactor.fetchedDealsFail(message: "Fail deals fetch")
        }
        it("should call a method fetchedDealsFail at presenter") {
          expect(presenter.functionCalled) == true
          expect(presenter.messageErrorPassed).notTo(beNil())
        }
      }
      
    }
    
  }
  
}




