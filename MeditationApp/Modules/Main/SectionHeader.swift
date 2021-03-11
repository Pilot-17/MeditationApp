//
//  SectionHeader.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 06.03.2021.
//

import UIKit

class SectionHeader: UICollectionReusableView {
  static let reuseIdentifier = "SectionHeader"
  
  // horiaontal
  let buttonMenu = UIButton(type: .custom)
  let logo = UIImageView()
  let buttonAvatar = UIButton(frame: CGRect.init(x: 0, y: 0, width: 35, height: 35))
  // vertical
  let title = UILabel()
  let subtitle = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    

    // horizontalStackView
    buttonMenu.setImage(UIImage(named: "Hamburger"), for: .normal)
    logo.image = UIImage(named: "Logo-1")
    logo.contentMode = .scaleAspectFit
    logo.layer.masksToBounds = true
    buttonAvatar.setImage(UIImage(named: "Profile"), for: .normal)
    buttonAvatar.translatesAutoresizingMaskIntoConstraints = false
    
    let horizontalStackView = UIStackView(arrangedSubviews: [buttonMenu, logo, buttonAvatar])
    horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    horizontalStackView.axis = .horizontal
    horizontalStackView.alignment = .fill
    horizontalStackView.distribution = .equalSpacing
    addSubview(horizontalStackView)
    
    // verticalStackView
    title.textColor = .white
    title.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 27, weight: .bold))
    subtitle.textColor = .gray
    subtitle.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .medium))
    
    let verticalStackView = UIStackView(arrangedSubviews: [title, subtitle])
    verticalStackView.translatesAutoresizingMaskIntoConstraints = false
    verticalStackView.axis = .vertical
    addSubview(verticalStackView)
    
    NSLayoutConstraint.activate([
      buttonAvatar.heightAnchor.constraint(equalToConstant: 35),
      buttonAvatar.widthAnchor.constraint(equalToConstant: 35),
      horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
      horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
      horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
    ])
    
    NSLayoutConstraint.activate([
      verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
      verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
      verticalStackView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 20),
      verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    verticalStackView.setCustomSpacing(10, after: title)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Stop trying to make storyboards happen.")
  }
}
