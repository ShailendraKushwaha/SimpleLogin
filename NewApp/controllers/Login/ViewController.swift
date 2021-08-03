//
//  ViewController.swift
//  NewApp
//
//  Created by SHAILENDRA KUSHWAHA on 30/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let gradientLayer : CAGradientLayer = {
        let gradient = CAGradientLayer()

        let firstColor = UIColor(red: 9/255, green: 88/255, blue: 147/255, alpha: 1.0).cgColor
        let secondColor = UIColor(red: 7/255, green: 197/255, blue: 245/255, alpha: 1.0).cgColor

        gradient.colors = [firstColor,secondColor]
        gradient.locations = [0.0,1.0]
        gradient.frame     = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: Int(UIScreen.main.bounds.height / 2))

        return gradient
    }()
    
    lazy var logoView: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "OTOS"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    lazy var backButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(self.backButtonTapped(sender:)), for: .touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 16)
        return button
    }()
    
    lazy var headerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self.logoView)
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        logoView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        view.addSubview(backButton)
        backButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 10).isActive = true
        
        return view
    }()
    
    let gradientView :UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 240/255, green: 244/255, blue: 255/255, alpha: 1.0)
        view.layer.cornerRadius = 44
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        return view
    }()
    
    lazy var createAccountLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Create an Account"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(red: 116/255, green: 117/255, blue: 117/255, alpha: 1.0)
        return label
    }()
    
    lazy var emailTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "example@gmail.com"
        textField.borderStyle = .none
        textField.delegate = self
        return textField
    }()
    
    lazy var nameField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "name"
        textField.borderStyle = .none
        textField.delegate = self
        return textField
    }()
    
    lazy var phoneField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "9876543210"
        textField.borderStyle = .none
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "password"
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    lazy var confirmPasswordField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "confirm password"
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    
    lazy var emailInputContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor(red: 230/255, green: 230/255, blue: 249/255, alpha: 0.31).cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1.0
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.topAnchor,constant: 12).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 4).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return view
    }()
    
    lazy var fullNameContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor(red: 230/255, green: 230/255, blue: 249/255, alpha: 0.31).cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1.0
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Full Name"
        label.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.topAnchor,constant: 12).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(nameField)
        nameField.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 4).isActive = true
        nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12).isActive = true
        nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return view
    }()
    
    lazy var phoneContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor(red: 230/255, green: 230/255, blue: 249/255, alpha: 0.31).cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1.0
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone"
        label.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.topAnchor,constant: 12).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(phoneField)
        phoneField.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 4).isActive = true
        phoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12).isActive = true
        phoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        phoneField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return view
    }()
    
    lazy var passwordContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor(red: 230/255, green: 230/255, blue: 249/255, alpha: 0.31).cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1.0
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.topAnchor,constant: 12).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(passwordField)
        passwordField.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 4).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return view
    }()
    
    lazy var confirmPasswordContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor(red: 230/255, green: 230/255, blue: 249/255, alpha: 0.31).cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1.0
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirm Password"
        label.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.topAnchor,constant: 12).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(confirmPasswordField)
        confirmPasswordField.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 4).isActive = true
        confirmPasswordField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12).isActive = true
        confirmPasswordField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        confirmPasswordField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return view
    }()
    
    lazy var createAccountButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.addTarget(self, action: #selector(self.createAccountTapped(sender:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 7/255, green: 188/255, blue: 237/255, alpha: 1.0)
        button.layer.cornerRadius = 12
        return button
    }()
    
    lazy var termsLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        var attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black])
        
        
        attributedString.append(NSAttributedString(string: "\nTerms 0f Service ", attributes: [NSAttributedString.Key.foregroundColor:UIColor.blue]))
        
        attributedString.append(NSAttributedString(string: "&", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black]))
        
        attributedString.append(NSAttributedString(string: " Privcy Policy", attributes: [NSAttributedString.Key.foregroundColor:UIColor.blue]))
        
        label.attributedText = attributedString
        label.textAlignment  = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.addSubview(gradientView)
        gradientView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        gradientView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        gradientView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        
        view.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 64).isActive = true

        view.addSubview(containerView)
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.85).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        containerView.addSubview(createAccountLabel)
        createAccountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        createAccountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        createAccountLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        createAccountLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 8).isActive = true
        
        containerView.addSubview(fullNameContainer)
        
        fullNameContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 28).isActive = true
        fullNameContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -28).isActive = true
        fullNameContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        fullNameContainer.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor,constant: 16).isActive = true
        
        containerView.addSubview(emailInputContainer)
        emailInputContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 28).isActive = true
        emailInputContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -28).isActive = true
        emailInputContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        emailInputContainer.topAnchor.constraint(equalTo: fullNameContainer.bottomAnchor,constant: 16).isActive = true
        
        containerView.addSubview(phoneContainer)
        phoneContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 28).isActive = true
        phoneContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -28).isActive = true
        phoneContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        phoneContainer.topAnchor.constraint(equalTo: emailInputContainer.bottomAnchor,constant: 16).isActive = true
        
        containerView.addSubview(passwordContainer)
        passwordContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 28).isActive = true
        passwordContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -28).isActive = true
        passwordContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        passwordContainer.topAnchor.constraint(equalTo: phoneContainer.bottomAnchor,constant: 16).isActive = true
        
        containerView.addSubview(confirmPasswordContainer)
        confirmPasswordContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 28).isActive = true
        confirmPasswordContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -28).isActive = true
        confirmPasswordContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        confirmPasswordContainer.topAnchor.constraint(equalTo: passwordContainer.bottomAnchor,constant: 16).isActive = true
        
        containerView.addSubview(createAccountButton)
        createAccountButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 28).isActive = true
        createAccountButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -28).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        createAccountButton.topAnchor.constraint(equalTo: confirmPasswordContainer.bottomAnchor,constant: 32).isActive = true
        
        containerView.addSubview(termsLabel)
        termsLabel.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor,constant: 16).isActive = true
        termsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 28).isActive = true
        termsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -28).isActive = true
        termsLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.MAIN_COLOR
    }
    
    @objc public func backButtonTapped(sender:Any) {
        self.navigationController?.popViewController(animated:true)
    }
    
    @objc public func createAccountTapped(sender:Any) {
        
    }
}

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == phoneField {
            if textField.text!.count == 10 {
                return false
            } else if textField.text!.count < 10 {
                return true
            }
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField == emailTextField) {
            if !isValidEmail(emailTextField.text!) {
                return false
            }else {
                return true
            }
        }
        
        if (textField == phoneField) {
            if phoneField.text!.count > 10 || phoneField.text!.count < 10 {
                return false
            }
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField == emailTextField) {
            if !isValidEmail(emailTextField.text!) {
                textField.resignFirstResponder()
                emailTextField.becomeFirstResponder()
            }
        }
        
       
    }
    
}
