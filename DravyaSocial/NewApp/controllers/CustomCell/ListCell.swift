//
//  ListCell.swift
//  NewApp
//
//  Created by SHAILENDRA KUSHWAHA on 30/10/21.
//

import UIKit

class ListCell: UITableViewCell {
    
    public static let reuseIdentifier = "list"
    
    private var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 7/255, green: 188/255, blue: 237/255, alpha: 1.0)
        view.layer.cornerRadius = 16
        return view
    }()
    
    private var primaryView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        return view
    }()
    
    private var iconView : ProfileImageView = {
        let view = ProfileImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 32
        view.layer.masksToBounds = true
        return view
    }()
    
    private var nameLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        return view
    }()
    
    var user : User? {
        didSet{
            self.setValues()
        }
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        contentView.backgroundColor = UIColor(red: 240/255, green: 244/255, blue: 255/255, alpha: 1.0)
        
        contentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 32).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -32).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8).isActive = true
        
        contentView.addSubview(primaryView)
        primaryView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8).isActive = true
        primaryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 38).isActive = true
        primaryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -32).isActive = true
        primaryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8).isActive = true
        
        primaryView.addSubview(iconView)
        iconView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iconView.leadingAnchor.constraint(equalTo: primaryView.leadingAnchor,constant: 16).isActive = true
        iconView.topAnchor.constraint(equalTo: primaryView.topAnchor,constant: 12).isActive = true
        
       
        primaryView.addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: primaryView.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: primaryView.bottomAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: primaryView.trailingAnchor,constant: -8).isActive = true
        
        
    }
    
    private func setValues(){
        
        guard let user = self.user else {
            return
        }
        
        self.iconView.setImageViaURL(url: user.Image ?? "")
        self.nameLabel.text = user.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
