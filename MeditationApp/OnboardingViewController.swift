//
//  OnboardingViewController.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 22.02.2021.
//

import UIKit

class OnboardingViewController: UIViewController {

  lazy var imageLogo: UIImageView = {
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
  
  lazy var buttonLogin: UIButton = {
    let btn = UIButton(type: .system)
    btn.tintColor = .white
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.backgroundColor = UIColor(red: 0.486, green: 0.604, blue: 0.573, alpha: 1)
    btn.setTitle("Войти в аккаунт", for: .normal)
    btn.titleLabel?.font = UIFont(name: "Alegreya-Medium", size: 25)
    btn.layer.cornerRadius = 10
    btn.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(imageLogo)
    view.addSubview(nameLabel)
    view.addSubview(descriptionLabel)
    view.addSubview(buttonLogin)
    view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40 ),
      stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    
    NSLayoutConstraint.activate([
      buttonLogin.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -20),
      buttonLogin.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -27),
      buttonLogin.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 27),
      buttonLogin.heightAnchor.constraint(equalToConstant: view.layer.bounds.width/6.5)
        ])
    
    NSLayoutConstraint.activate([
      descriptionLabel.bottomAnchor.constraint(equalTo: self.buttonLogin.topAnchor, constant: -95),
      descriptionLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
      descriptionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
        ])
    
    NSLayoutConstraint.activate([
      nameLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor, constant: 0),
      nameLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
      nameLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
        ])
    
    NSLayoutConstraint.activate([
      imageLogo.bottomAnchor.constraint(equalTo: self.nameLabel.topAnchor, constant: 100),
      imageLogo.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
      imageLogo.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
        ])
  }
  
  @objc func loginButtonAction() {
    let vc = LoginViewController()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true, completion: nil)
  }
}

