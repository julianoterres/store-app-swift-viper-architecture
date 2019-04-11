//
//  DealsListViewController.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of DealsListViewController
class DealsListViewController: UIViewController {
  
  let navigation = UIView()
  let navigationTitle = UILabel()
  let tableView = UITableView()
  let label = UILabel()
  let loader = UIActivityIndicatorView()
  
  var presenter: DealsListViewControllerToPresenterProtocol?
  var dealsListView: DealsListViewEntity!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addElementsInScreen()
    setupElements()
    addConstraintsInElements()
    presenter?.fetchDeals()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  func addElementsInScreen() {
    navigation.addSubview(navigationTitle)
    view.addSubviews(elements: [loader, navigation, tableView])
  }
  
  func setupElements() {
    view.backgroundColor = Colors.lightGrey
    tableView.delegate = self
    tableView.dataSource = self
    tableView.estimatedRowHeight = DealsListCell.height
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(DealsListCell.self, forCellReuseIdentifier: DealsListCell.identifier)
    tableView.separatorStyle = .none
    tableView.isHidden = true
    loader.startAnimating()
    loader.color = .black
    navigation.backgroundColor = Colors.blue
    navigationTitle.setFontTitleWhite()
  }
  
  func addConstraintsInElements() {
    let navigationHeigth = UIApplication.shared.statusBarFrame.size.height + 44
    navigation.addConstraint(attribute: .top, alignElement: view, alignElementAttribute: .top, constant: 0)
    navigation.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    navigation.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    navigation.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: navigationHeigth)
    navigationTitle.addConstraint(attribute: .left, alignElement: navigation, alignElementAttribute: .left, constant: 15)
    navigationTitle.addConstraint(attribute: .bottom, alignElement: navigation, alignElementAttribute: .bottom, constant: 0)
    navigationTitle.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 44)
    
    tableView.addConstraint(attribute: .top, alignElement: navigation, alignElementAttribute: .bottom, constant: 0)
    tableView.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    tableView.addConstraint(attribute: .bottom, alignElement: view, alignElementAttribute: .bottom, constant: 0)
    tableView.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    loader.addConstraint(attribute: .centerX, alignElement: view, alignElementAttribute: .centerX, constant: 0)
    loader.addConstraint(attribute: .centerY, alignElement: view, alignElementAttribute: .centerY, constant: 0)
  }
  
}

// MARK: Methods of DealsListPresenterToViewControllerProtocol
extension DealsListViewController: DealsListPresenterToViewControllerProtocol {
  
  func displayFetchedDeals(dealsView: DealsListViewEntity){
    dealsListView = dealsView
    navigationTitle.text = dealsListView.titleNavitagion
    loader.isHidden = true
    tableView.isHidden = false
    tableView.reloadData()
  }
  
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource
extension DealsListViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dealsListView.deals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: DealsListCell.identifier, for: indexPath) as? DealsListCell {
      cell.setup(dealsView: dealsListView.deals[indexPath.row])
      return cell
    }
    return UITableViewCell()
  }
  
}
