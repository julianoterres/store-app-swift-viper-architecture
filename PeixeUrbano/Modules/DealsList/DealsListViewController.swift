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
  
  let tableView = UITableView()
  let label = UILabel()
  let loader = UIActivityIndicatorView()
  
  var presenter: DealsListPresenterProtocol?
  var deals = [DealsViewEntity]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addElementsInScreen()
    setupElements()
    addConstraintsInElements()
    presenter?.fetchDeals()
  }
  
  func addElementsInScreen() {
    view.addSubviews(elements: [tableView, loader])
  }
  
  func setupElements() {
    view.backgroundColor = Colors.blue
    tableView.delegate = self
    tableView.dataSource = self
    tableView.estimatedRowHeight = DealsListCell.height
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(DealsListCell.self, forCellReuseIdentifier: DealsListCell.identifier)
    tableView.isHidden = true
    loader.startAnimating()
    loader.color = .white
  }
  
  func addConstraintsInElements() {
    tableView.addConstraint(attribute: .top, alignElement: view, alignElementAttribute: .top, constant: 0)
    tableView.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    tableView.addConstraint(attribute: .bottom, alignElement: view, alignElementAttribute: .bottom, constant: 0)
    tableView.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    loader.addConstraint(attribute: .centerX, alignElement: view, alignElementAttribute: .centerX, constant: 0)
    loader.addConstraint(attribute: .centerY, alignElement: view, alignElementAttribute: .centerY, constant: 0)
  }
  
}

// MARK: Methods of DealsListViewController
extension DealsListViewController: DealsListViewControllerProtocol {
  
  func displayFetchedDeals(dealsView: [DealsViewEntity]){
    deals = dealsView
    loader.isHidden = true
    tableView.isHidden = false
    tableView.reloadData()
  }
  
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource
extension DealsListViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return deals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: DealsListCell.identifier, for: indexPath) as? DealsListCell {
      cell.setup(dealView: deals[indexPath.row])
      return cell
    }
    return UITableViewCell()
  }
  
}
