//
//  LoginViewController.swift
//  MeditationApp
//
//  Created by Almat Kulbaev on 22.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
  
  lazy var emailTextField: UITextField = {
    let txtFld = UITextField()
    txtFld.translatesAutoresizingMaskIntoConstraints = false
    txtFld.backgroundColor = .clear
    txtFld.tintColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    txtFld.textColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    txtFld.attributedPlaceholder = NSAttributedString(string: "Email",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    return txtFld
  }()
  
  lazy var passwordTextField: UITextField = {
    let txtFld = UITextField()
    txtFld.translatesAutoresizingMaskIntoConstraints = false
    txtFld.backgroundColor = .clear
    txtFld.tintColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    txtFld.textColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    txtFld.attributedPlaceholder = NSAttributedString(string: "Пароль",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    return txtFld
  }()
  
  lazy var emailUIView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    return view
  }()
  
  lazy var passwordUIView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(red: 0.745, green: 0.761, blue: 0.761, alpha: 1)
    return view
  }()
  
  lazy var buttonLogin: UIButton = {
    let btn = UIButton(type: .system)
    btn.tintColor = .white
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.backgroundColor = UIColor(red: 0.486, green: 0.604, blue: 0.573, alpha: 1)
    btn.setTitle("ВОЙТИ", for: .normal)
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
  
  lazy var loginLabel: UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.textColor = .white
    lbl.text = "Вход"
    lbl.font = UIFont(name: "Alegreya-Medium", size: 30)
    return lbl
  }()
  
  lazy var logoImageView: UIImageView = {
    let img = UIImageView()
    img.translatesAutoresizingMaskIntoConstraints = false
    img.image = UIImage(named: "Logo")
    img.contentMode = .scaleAspectFit
    img.layer.masksToBounds = true
    return img
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0.145, green: 0.2, blue: 0.204, alpha: 1)
    
    let imageBackground = UIImageView(image: UIImage(named: "backgroundLogin"))
    view.addSubview(imageBackground)
    imageBackground.translatesAutoresizingMaskIntoConstraints  = false
    imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    imageBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    imageBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    
    view.addSubview(emailUIView)
    view.addSubview(passwordUIView)
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(buttonLogin)
    view.addSubview(stackView)
    view.addSubview(loginLabel)
    view.addSubview(logoImageView)
    
    NSLayoutConstraint.activate([
      loginLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -100),
      loginLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
      loginLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
    
    NSLayoutConstraint.activate([
      logoImageView.bottomAnchor.constraint(equalTo: loginLabel.topAnchor, constant: -10),
      logoImageView.leftAnchor.constraint(equalTo: loginLabel.leftAnchor, constant: -20),
      logoImageView.heightAnchor.constraint(equalToConstant: 100),
      logoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    
    NSLayoutConstraint.activate([ 
      stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: view.bounds.height < 700 ? -100 : -150),
      stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    
    NSLayoutConstraint.activate([
      buttonLogin.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -23),
      buttonLogin.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -27),
      buttonLogin.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 27),
      buttonLogin.heightAnchor.constraint(equalToConstant: view.layer.bounds.width/6.5)
      
        ])
    
    NSLayoutConstraint.activate([
      emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
      emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
      emailTextField.heightAnchor.constraint(equalToConstant: 40),
      emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -30)
        ])
    
    NSLayoutConstraint.activate([
      emailUIView.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 0),
      emailUIView.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: 0),
      emailUIView.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 0),
      emailUIView.heightAnchor.constraint(equalToConstant: 2)
        ])
    
    NSLayoutConstraint.activate([
      passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
      passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
      passwordTextField.heightAnchor.constraint(equalToConstant: 40),
      passwordTextField.bottomAnchor.constraint(equalTo: buttonLogin.topAnchor, constant: -55)
        ])
    
    NSLayoutConstraint.activate([
      passwordUIView.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 0),
      passwordUIView.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: 0),
      passwordUIView.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor, constant: 0),
      passwordUIView.heightAnchor.constraint(equalToConstant: 2)
        ])

  }
}
