//
//  AppDelegate.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.mainScreen()
    return true
  }
  
  private func mainScreen() {
    let appRouter = AppRouter()
    let tabBar = appRouter.createTabBar()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = tabBar
    window?.makeKeyAndVisible()
  }

}

