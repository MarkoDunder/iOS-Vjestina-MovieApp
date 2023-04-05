//
//  LogInViewController.swift
//  MovieApp
//
//  Created by endava-bootcamp on 31.03.2023..
//
import Foundation
import UIKit
import PureLayout

class LogInViewController: UIViewController {
    
    var signInButton=UIButton()
    var titleLabel=UILabel()
    var emailTextField=UITextField()
    var passwordTextField=UITextField()
    var emailLabel=UILabel()
    var passwordLabel=UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hue: 0.6056, saturation: 0.99, brightness: 0.48, alpha: 1.0) 


        titleLabel.text = "Sign in"
        titleLabel.textColor = UIColor.white
        titleLabel.font=UIFont.systemFont(ofSize: 24, weight: .bold)
        
        emailTextField.placeholder = "Enter your mail here"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        
        passwordTextField.placeholder = "Enter your password here"
        passwordTextField.borderStyle = .roundedRect
        
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.backgroundColor = .systemBlue
        signInButton.layer.cornerRadius = 10
        
        emailLabel.textColor = .white
        emailLabel.text = "Email:"
        
        passwordLabel.text = "Password:"
        passwordLabel.textColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        
        setupConstraints()
       
        
    }
    func setupConstraints() {
        titleLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 64)
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        
        emailLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 40)
        emailLabel.autoPinEdge(.left, to: .left, of: view, withOffset: 16)
        
        emailTextField.autoPinEdge(.top, to: .bottom, of: emailLabel, withOffset: 20)
        emailTextField.autoPinEdge(.left, to: .left, of: view, withOffset: 16)
        emailTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        emailTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        
        passwordLabel.autoPinEdge(.top, to: .bottom, of: emailTextField, withOffset: 40)
        passwordLabel.autoPinEdge(.left, to: .left, of: view, withOffset: 16)
        passwordTextField.autoPinEdge(.top, to:.bottom , of: passwordLabel, withOffset: 10)
        passwordTextField.autoPinEdge(.left, to: .left, of: view, withOffset: 16)
        passwordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        passwordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        
        signInButton.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: 30)
        signInButton.autoPinEdge(.leading, to: .leading, of: view)
        signInButton.autoPinEdge(toSuperviewEdge: .left, withInset: 40)
        signInButton.autoPinEdge(toSuperviewEdge: .right, withInset: 40)
        
        
    }
    

}
