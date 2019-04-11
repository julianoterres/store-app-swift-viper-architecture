//
//  UIViewExtension.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

extension UIView {
  
  func addSubviews(elements: [UIView]) {
    for element in elements {
      self.addSubview(element)
    }
  }
  
  func addConstraint(attribute: NSLayoutConstraint.Attribute, alignElement: UIView?, alignElementAttribute: NSLayoutConstraint.Attribute, constant: CGFloat, typeSize: NSLayoutConstraint.Relation = .equal) {
    self.translatesAutoresizingMaskIntoConstraints = false
    let constraint = NSLayoutConstraint(
      item: self,
      attribute: attribute,
      relatedBy: typeSize,
      toItem: alignElement,
      attribute: alignElementAttribute,
      multiplier: 1,
      constant: (attribute == .right || attribute == .bottom) ? (constant * -1) : constant
    )
    NSLayoutConstraint.activate([constraint])
  }
  
}
