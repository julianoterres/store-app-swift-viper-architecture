//
//  UIStackViewExtension.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

extension UIStackView {
  
  func addViews(elements: [UIView]) {
    for element in elements {
      self.addArrangedSubview(element)
    }
  }
  
}
