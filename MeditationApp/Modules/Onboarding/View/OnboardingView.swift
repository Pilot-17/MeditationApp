//
//  OnboardingView.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 04.03.2021.
//

import UIKit

class OnboardingView: UIView {
  
  var delegate: OnboardingViewControllerProtocol?

  init() {
    super.init(frame: .zero)
    addSubview()
    loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
  }
  
  override func layoutSubviews() {
    setupLayout()
    contentMode = UIView.ContentMode.scaleAspectFit
    layer.contents = UIImage(named:"Background.png")?.cgImage
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var logoImageView: UIImageView = {
     let img = UIImageView()
     img.translatesAutoresizingMaskIntoConstraints = false
     img.image = UIImage(named: "Logo")
     img.contentMode = .scaleAspectFit
     img.layer.masksToBounds = true
     return img
   }()
   
   lazy var nameLabel: UILabel = {
     let lbl = UILabel()
     lbl.translatesAutoresizingMaskIntoConstraints = false
     lbl.textColor = .white
     lbl.textAlignment = .center
     lbl.text = "ПРИВЕТ"
     lbl.font = UIFont(name: "Alegreya-Bold", size: 34)
     
     return lbl
   }()
   
   lazy var descriptionLabel: UILabel = {
     let lbl = UILabel()
     lbl.translatesAutoresizingMaskIntoConstraints = false
     lbl.numberOfLines = 0
     lbl.textColor = .white
     lbl.textAlignment = .center
     lbl.text = "Наслаждайся отборочными. \nБудь внимателен. \nДелай Хорошо."
     lbl.font = UIFont(name: "Alegreya-Medium", size: 25)
     return lbl
   }()
   
   lazy var loginButton: UIButton = {
     let btn = UIButton(type: .system)
     btn.tintColor = .white
     btn.translatesAutoresizingMaskIntoConstraints = false
     btn.backgroundColor = UIColor(red: 0.486, green: 0.604, blue: 0.573, alpha: 1)
     btn.setTitle("Войти в аккаунт", for: .normal)
     btn.titleLabel?.font = UIFont(name: "Alegreya-Medium", size: 25)
     btn.layer.cornerRadius = 10
     return btn
   }()
   
   lazy var signUpLabel: UILabel = {
     let lbl = UILabel()
     lbl.translatesAutoresizingMaskIntoConstraints = false
     lbl.textColor = .white
     lbl.text = "Еще нет аккаунта?"
     lbl.font = UIFont(name: "Alegreya-Medium", size: 20)
     return lbl
   }()
   
   lazy var signUpButton: UIButton = {
     let btn = UIButton(type: .system)
     btn.tintColor = .white
     btn.translatesAutoresizingMaskIntoConstraints = false
     btn.setTitle("Зарегистрируйтесь", for: .normal)
     btn.titleLabel?.font = UIFont(name: "Alegreya-Bold", size: 20)
     btn.isUserInteractionEnabled = true
     return btn
   }()
   
   lazy var stackView: UIStackView = {
     let stackView = UIStackView()
     stackView.axis  = .horizontal
     stackView.distribution  = .fillEqually
     stackView.alignment = .fill
     stackView.spacing = 1.0
     stackView.addArrangedSubview(signUpLabel)
     stackView.addArrangedSubview(signUpButton)
     stackView.translatesAutoresizingMaskIntoConstraints = false
     return stackView
   }()
  
  @objc func loginButtonAction() {
    delegate?.loginButtonAction()
  }
  
}

// MARK: Add Subview

extension OnboardingView {
  
  func addSubview() {
    addSubview(logoImageView)
    addSubview(nameLabel)
    addSubview(descriptionLabel)
    addSubview(loginButton)
    addSubview(stackView)
  }
}

// MARK: Setup Layout

extension OnboardingView {
  
  func setupLayout() {
    
    NSLayoutConstraint.activate([
      stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40 ),
      stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      loginButton.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
      loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -27),
      loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 27),
      loginButton.heightAnchor.constraint(equalToConstant: layer.bounds.width/6.5)
    ])
    
    NSLayoutConstraint.activate([
      descriptionLabel.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -95),
      descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
    ])
    
    NSLayoutConstraint.activate([
      nameLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 0),
      nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
    ])
    
    NSLayoutConstraint.activate([
      logoImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 100),
      logoImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      logoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
    ])
  }
  
}
