//
//  AppRouter.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

class AppRouter {
  
  func createTabBar() -> UITabBarController {
    
    let tabBarController = UITabBarController()
    
    let dealsListRouter = DealsListRouter()
    let viewControllerCity = dealsListRouter.createModule()
    viewControllerCity.tabBarItem = UITabBarItem(title: "Na cidade", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
    
    tabBarController.viewControllers = [viewControllerCity]
    
    return tabBarController
  }
  
}
