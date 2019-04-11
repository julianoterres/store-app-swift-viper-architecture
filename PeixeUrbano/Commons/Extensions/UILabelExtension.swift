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
    self.textColor = Colors.title
  }
  
  func setFontTitleWhite() {
    self.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
    self.textColor = Colors.titleWhite
  }
  
  func setFontSubtitle() {
    self.font = UIFont(name: "HelveticaNeue", size: 12)
    self.textColor = Colors.subtitle
  }
  
  func setFontPrice() {
    self.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
    self.textColor = Colors.orange
  }
  
}
