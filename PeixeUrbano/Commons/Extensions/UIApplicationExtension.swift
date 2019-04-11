//
//  UIApplicationExtension.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 11/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

extension UIApplication {
  
  var statusBarView: UIView? {
    return value(forKey: "statusBar") as? UIView
  }
  
}
