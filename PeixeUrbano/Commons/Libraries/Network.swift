//
//  Network.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of Network
class Network: NetworkProtocol {
  
  func request(url: URL?, method: NetworkHttpMethod, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    guard let url = url else {
      failure("URL not defined")
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    print("#######################################")
    print("->REQUEST URL "  + method.rawValue)
    print(url.absoluteString)
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      do {
        guard let responseData = data else {
          failure("Error receive data")
          return
        }
        if let json = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String:Any] {
          print("#######################################")
          print("->REQUEST RESPONSE " + method.rawValue)
          print(String(data: try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted), encoding: .utf8)!)
        }
        DispatchQueue.main.async {
          success(responseData)
        }
      } catch let error {
        DispatchQueue.main.async {
          failure(error.localizedDescription)
        }
      }
    }
    task.resume();
  }
  
}
