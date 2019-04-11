//
//  DealsListCell.swift
//  PeixeUrbano
//
//  Created by Juliano Terres on 10/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: Methods of DealsListCell
class DealsListCell: UITableViewCell {
  
  let img = UIImageView()
  let title = UILabel()
  let partner = UILabel()
  let stack = UIStackView()
  let priceOld = UILabel()
  let priceNew = UILabel()
  
  static let height = CGFloat(243)
  static let identifier = "DealsListCell"
  
  var deal: DealsEntity?
  
  func setup(dealsView: DealsEntity?) {
    selectionStyle = .none
    deal = dealsView
    addElementsInScreen()
    setupElements()
    addConstraintsInElements()
  }
  
  func addElementsInScreen() {
    stack.addViews(elements: [priceOld, priceNew])
    contentView.addSubviews(elements: [img, title, partner, stack])
  }
  
  func setupElements() {
    setupImage()
    setupTitle()
    setupStackView()
    setupPartner()
  }
  
  func setupImage() {
    img.kf.setImage(with: deal?.image, placeholder: UIImage(named: "placeholder"))
    img.contentMode = .scaleAspectFill
    img.clipsToBounds = true
  }
  
  func setupTitle() {
    title.text = deal?.title ?? ""
    title.numberOfLines = 0
    title.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    title.setFontTitle()
  }
  
  func setupPartner() {
    partner.text = deal?.partner ?? ""
    partner.numberOfLines = 0
    partner.setFontTitleWhite()
  }
  
  func setupStackView() {
    stack.axis = .vertical
    stack.alignment = .trailing
    stack.spacing = 0
    priceOld.text = "A partir de"
    priceOld.numberOfLines = 1
    priceOld.setFontSubtitle()
    priceNew.text = deal?.price ?? ""
    priceNew.numberOfLines = 1
    priceNew.setFontPrice()
  }
  
  func addConstraintsInElements() {
    img.addConstraint(attribute: .top, alignElement: contentView, alignElementAttribute: .top, constant: 0)
    img.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 0)
    img.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 0)
    img.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 190)
    partner.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 15)
    partner.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 15)
    partner.addConstraint(attribute: .bottom, alignElement: img, alignElementAttribute: .bottom, constant: 15)
    title.addConstraint(attribute: .top, alignElement: img, alignElementAttribute: .bottom, constant: 15)
    title.addConstraint(attribute: .right, alignElement: stack, alignElementAttribute: .left, constant: 15)
    title.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 15)
    title.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 15)
    stack.addConstraint(attribute: .centerY, alignElement: title, alignElementAttribute: .centerY, constant: 0)
    stack.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 15)
  }
  
}
