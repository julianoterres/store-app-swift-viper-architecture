//
//  Protocols.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of APIProtocol
protocol APIProtocol: class {
  func urlCity() -> URL
  func urlTravels() -> URL
  func urlProducts() -> URL
}

// MARK: Methods of NetworkProtocol
protocol NetworkProtocol: class {
  func request(url: URL?, method: NetworkHttpMethod, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void)
}
