//
//  SplashScreenVC.swift
//  NewApp
//
//  Created by SHAILENDRA KUSHWAHA on 30/10/21.
//

import UIKit

class SplashScreenVC: UIViewController {
    
    private let gradientLayer : CAGradientLayer = {
        let gradient = CAGradientLayer()

        let firstColor = UIColor(red: 9/255, green: 88/255, blue: 147/255, alpha: 1.0).cgColor
        let secondColor = UIColor(red: 7/255, green: 197/255, blue: 245/255, alpha: 1.0).cgColor

        gradient.colors = [firstColor,secondColor]
        gradient.locations = [0.0,1.0]
        gradient.frame     = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: Int(UIScreen.main.bounds.height / 2))

        return gradient
    }()
    
    let gradientView :UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(gradientView)
        gradientView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        gradientView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        gradientView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
