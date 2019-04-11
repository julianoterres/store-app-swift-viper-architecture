//
//  DealsListDealEntity.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

struct DealsListDealEntity: Codable {
  let dealImage: String
  let short_title: String
  let partner: DealsListPartnerEntity
  let full_price: Float
  let sale_price: Float
  let min_sale_price: Float
}
