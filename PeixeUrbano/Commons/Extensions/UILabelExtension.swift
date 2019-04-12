//
//  UILabelExtension.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

extension UILabel {
  
  func setFontTitle() {
    self.font = UIFont(name: "HelveticaNeue", size: 14)
    self.textColor = .defaultTitle
  }
  
  func setFontTitleWhite() {
    self.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
    self.textColor = .defaultTitleWhite
  }
  
  func setFontSubtitle() {
    self.font = UIFont(name: "HelveticaNeue", size: 12)
    self.textColor = .defaultSubtitle
  }
  
  func setFontPrice() {
    self.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
    self.textColor = .defaultOrange
  }
  
}
