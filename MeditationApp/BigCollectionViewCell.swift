//
//  BigCollectionViewCell.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 23.02.2021.
//

import UIKit

class BigCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var view: UIView!
  @IBOutlet weak var button: UIButton!
  
  static let reuseIdentifier = "BigCollectionViewCell"
  
    override func awakeFromNib() {
        super.awakeFromNib()
      view.layer.cornerRadius = 20
      button.layer.cornerRadius = 10
    }

}
