//
//  FloatExtension.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

extension Float {
  
  var currency: String {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "pt_BR")
    formatter.numberStyle = NumberFormatter.Style.currency
    formatter.positivePrefix = "R$ "
    return formatter.string(for: self) ?? "R$ 0,00"
  }
  
}
