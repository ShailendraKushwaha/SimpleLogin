//
//  DashboardVC.swift
//  NewApp
//
//  Created by SHAILENDRA KUSHWAHA on 30/10/21.
//

import UIKit

class DashboardVC: UIViewController {

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
        
        var attributedString = NSMutableAttributedString(string: "Dravya", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 28)])
        attributedString.append(NSAttributedString(string: "\nDashboard", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 26)]))
        
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var backButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.addTarget(self, action: #selector(self.backButtonTapped(sender:)), for: .touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 16)
        return button
    }()
    
    lazy var headerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backButton)
        backButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
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
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        return view
    }()
    
   
    
    lazy var listContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor(red: 230/255, green: 230/255, blue: 249/255, alpha: 0.31).cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1.0
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "All Users"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(label)
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -12).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints  = false
        imageView.image = UIImage(named: "list")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -8).isActive = true
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.listTapped(sender:))))
        
        return view
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
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.75).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        view.addSubview(self.logoView)
        logoView.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 2).isActive = true
        logoView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:20).isActive = true
        logoView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        containerView.addSubview(self.listContainer)
        listContainer.widthAnchor.constraint(equalTo: containerView.widthAnchor,multiplier: 0.4).isActive = true
        listContainer.heightAnchor.constraint(equalTo: containerView.widthAnchor,multiplier: 0.4).isActive = true
        listContainer.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 32).isActive = true
        listContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 28).isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.MAIN_COLOR
    }
    
    @objc public func backButtonTapped(sender:Any) {
        self.navigationController?.popViewController(animated:true)
    }
    
    @objc public func listTapped(sender:Any) {
        self.navigationController?.pushViewController(MYListVC(), animated: true)
    }
    
}
