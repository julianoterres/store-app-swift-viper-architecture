//
//  Api.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of API
class API: APIProtocol {
  
  private let baseUlr = "https://gist.githubusercontent.com/insidegui/"
  
  func urlCity() -> URL {
    return URL(string: baseUlr + "2b1f747ebeb9070e33818bf857e28a84/raw/5da63767fda2ec16f4ae0718e3be4be75001fe10/florianopolis.json")!
  }
  
  func urlTravels() -> URL {
    return URL(string: baseUlr + "d2665b556f2be1b1ad3a19d2ef9bcc44/raw/afe1e0a9563e3bcddc3796b22becb8f12f82ee2e/viagens.json")!
  }
  
  func urlProducts() -> URL {
    return URL(string: baseUlr + "007fd6664650391dca199e6784d1f351/raw/862d701c69307f9e9053f8cb1ec438586fca4b64/produtos.json")!
  }
  
}
