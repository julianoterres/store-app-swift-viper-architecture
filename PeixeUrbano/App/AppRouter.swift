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
    let dealsListRouter = DealsListRouter()
    
    let viewControllerCity = dealsListRouter.createModule(screenType: .city)
    viewControllerCity.tabBarItem = UITabBarItem(title: "Na cidade", image: UIImage(named: "skyline"), selectedImage: UIImage(named: "skyline"))
    
    let viewControllerTravel = dealsListRouter.createModule(screenType: .travel)
    viewControllerTravel.tabBarItem = UITabBarItem(title: "Viagens", image: UIImage(named: "airplane"), selectedImage: UIImage(named: "airplane"))
    
    let viewControllerProducts = dealsListRouter.createModule(screenType: .products)
    viewControllerProducts.tabBarItem = UITabBarItem(title: "Produtos", image: UIImage(named: "shopping_bag"), selectedImage: UIImage(named: "shopping_bag"))
    
    let tabBarController = UITabBarController()
    tabBarController.tabBar.tintColor = Colors.orange
    tabBarController.viewControllers = [viewControllerCity, viewControllerTravel, viewControllerProducts]
    
    return tabBarController
  }
  
}
