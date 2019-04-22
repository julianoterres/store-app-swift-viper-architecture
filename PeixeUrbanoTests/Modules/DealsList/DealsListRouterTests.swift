//
//  DealsListRouterTests.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import PeixeUrbano

// MARK: Methods of DealsListRouterTests
class DealsListRouterTests: QuickSpec {
  
  override func spec() {
    
    var router: DealsListRouter!
    var viewController: UIViewController!
    
    describe("DealsListRouter") {
      
      beforeEach {
        router = DealsListRouter()
      }
      
      describe("When router execute the method buildModule") {
        beforeEach {
          viewController = router.buildModule(screenType: .city)
        }
        it("should return a viewController") {
          expect(viewController).to(beAKindOf(UIViewController.self))
        }
      }
      
    }
    
  }
  
}





