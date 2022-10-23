//
//  LoginViewController.swift
//  InstagramApp3
//
//  Created by Huu Thanh on 23/10/2022.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundColor = UIImageView(image: UIImage(named: "ic_gradient"))
        header.addSubview(backgroundColor)
        return header
    }()
    
    private let usernameEmailFiled: UITextField = {
        let field =  UITextField()
        field.placeholder = "UserName or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 8.0
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordFiled: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 8.0
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8.0
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let createAccButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Servicd ", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("privacy Policy ", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)
        createAccButton.addTarget(self,
                              action: #selector(didTapCreateAccButton),
                              for: .touchUpInside)
        termsButton.addTarget(self,
                              action: #selector(didTapTermsButton),
                              for: .touchUpInside)
        privacyButton.addTarget(self,
                              action: #selector(didTapPrivacyButton),
                              for: .touchUpInside)
        
        
        usernameEmailFiled.delegate = self
        passwordFiled.delegate = self
        
        addSubviews()
        
        view.backgroundColor = .systemBackground

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frames
        headerView.frame = CGRect(x: 0.0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height/3)
        
        usernameEmailFiled.frame = CGRect(x: 25,
                                  y: headerView.bottom + 16,
                                  width: view.width - 50,
                                          height: 52.0)
        
        passwordFiled.frame = CGRect(x: 25,
                                  y: usernameEmailFiled.bottom + 16,
                                  width: view.width - 50,
                                     height: 52.0)
        
        loginButton.frame = CGRect(x: 25,
                                  y: passwordFiled.bottom + 16,
                                  width: view.width - 50,
                                   height: 52.0)
        
        createAccButton.frame = CGRect(x: 25,
                                  y: loginButton.bottom + 16,
                                  width: view.width - 50,
                                       height: 52.0)
        
        termsButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 100,
                                   width: view.width - 20,
                                   height: 50)
        
        privacyButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 50,
                                   width: view.width - 20,
                                   height: 50)
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroudView = headerView.subviews.first else {
            return
        }
        
        backgroudView.frame = headerView.bounds
        let imageView = UIImageView(image: UIImage(named: "text_instagram"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width / 4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width / 2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
      
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailFiled)
        view.addSubview(passwordFiled)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccButton)
        view.addSubview(headerView)
        
    }
    
    @objc private func didTapLoginButton() {
        passwordFiled.resignFirstResponder()
        usernameEmailFiled.resignFirstResponder()
        guard let username = usernameEmailFiled.text, !username.isEmpty , let passwword = passwordFiled.text, !passwword.isEmpty , passwword.count >= 8 else {
            return
        }
    }
    
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870/?helpref=hc_fnav") else {
        return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://privacycenter.instagram.com/policy") else {
        return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapCreateAccButton() {
         let vc = RegistrationViewController()
        present(vc, animated: true)
    }
            
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        if textfield == usernameEmailFiled {
            passwordFiled.becomeFirstResponder()
        } else if textfield == passwordFiled {
            didTapLoginButton()
        }
        return true
    }
    
}
