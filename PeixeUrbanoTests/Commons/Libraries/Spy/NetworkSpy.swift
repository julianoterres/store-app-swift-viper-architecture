//
//  NetworkSpy.swift
//  PeixeUrbanoTests
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import PeixeUrbano
import Foundation

// MARK: Methods of NetworkSuccessSpy
class NetworkSuccessSpy: NetworkProtocol {
  
  func request(url: URL?, method: NetworkHttpMethod, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    success(Data())
  }
  
}

// MARK: Methods of NetworkFailSpy
class NetworkFailSpy: NetworkProtocol {
  
  func request(url: URL?, method: NetworkHttpMethod, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    failure("Fail request")
  }
  
}
