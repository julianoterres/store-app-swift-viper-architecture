//
//  DealsListWorkerTests.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import PeixeUrbano

// MARK: Methods of DealsListWorkerTests
class DealsListWorkerTests: QuickSpec {
  
  override func spec() {
    
    var worker: DealsListWorker!
    var interactor: DealsListInteractorSpy!
    var network: NetworkProtocol!
    var api: APIProtocol!
    
    describe("DealsListWorker") {
      
      beforeEach {
        worker = DealsListWorker()
        interactor = DealsListInteractorSpy()
        api = API()
        worker.interactor = interactor
        worker.network = network
        worker.api = api
      }
      
      describe("When worker execute the method fetchDeals") {
        
        context("and request is success") {
          beforeEach {
            network = NetworkSuccessSpy()
            worker.network = network
            worker.fetchDeals(url: api.urlCity())
          }
          it("should call a method fetchedDeals at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
        context("and request is fail") {
          beforeEach {
            network = NetworkFailSpy()
            worker.network = network
            worker.fetchDeals(url: api.urlCity())
          }
          it("should call a method fetchedDealsFail at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
      }
      
      describe("When worker execute the method fetchDealsCity") {
        
        context("and request is success") {
          beforeEach {
            network = NetworkSuccessSpy()
            worker.network = network
            worker.fetchDealsCity()
          }
          it("should call a method fetchedDeals at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
        context("and request is fail") {
          beforeEach {
            network = NetworkFailSpy()
            worker.network = network
            worker.fetchDealsCity()
          }
          it("should call a method fetchedDealsFail at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
      }
      
    }
    
    describe("When worker execute the method fetchDealsTravel") {
      
      context("and request is success") {
        beforeEach {
          network = NetworkSuccessSpy()
          worker.network = network
          worker.fetchDealsTravel()
        }
        it("should call a method fetchedDeals at interactor") {
          expect(interactor.functionCalled) == true
        }
      }
      
      context("and request is fail") {
        beforeEach {
          network = NetworkFailSpy()
          worker.network = network
          worker.fetchDealsTravel()
        }
        it("should call a method fetchedDealsFail at interactor") {
          expect(interactor.functionCalled) == true
        }
      }
      
    }
    
    describe("When worker execute the method fetchDealsProducts") {
      
      context("and request is success") {
        beforeEach {
          network = NetworkSuccessSpy()
          worker.network = network
          worker.fetchDealsProducts()
        }
        it("should call a method fetchedDeals at interactor") {
          expect(interactor.functionCalled) == true
        }
      }
      
      context("and request is fail") {
        beforeEach {
          network = NetworkFailSpy()
          worker.network = network
          worker.fetchDealsProducts()
        }
        it("should call a method fetchedDealsFail at interactor") {
          expect(interactor.functionCalled) == true
        }
      }
      
    }
    
  }
  
}



