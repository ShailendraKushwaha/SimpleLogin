//
//  ListCell.swift
//  NewApp
//
//  Created by SHAILENDRA KUSHWAHA on 30/06/21.
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
    
    private var iconView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cloth")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private var nameLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.text = "Baby Cloth"
        return view
    }()
    
    private var quantityLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .right
        view.textColor = .gray
        view.text = "10/12"
        return view
    }()
    
    private var moreIcon : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ellispis")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var item:ListItem?{
      didSet{
        iconView.image = UIImage(named: item?.imageName ?? "cloth" )
        nameLabel.text = item?.name
        quantityLabel.text = item?.numbers
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
        iconView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        iconView.leadingAnchor.constraint(equalTo: primaryView.leadingAnchor,constant: 24).isActive = true
        iconView.topAnchor.constraint(equalTo: primaryView.topAnchor,constant: 6).isActive = true
        
        primaryView.addSubview(moreIcon)
        moreIcon.widthAnchor.constraint(equalToConstant: 15).isActive = true
        moreIcon.widthAnchor.constraint(equalToConstant: 44).isActive = true
        moreIcon.trailingAnchor.constraint(equalTo: primaryView.trailingAnchor,constant: -8).isActive = true
        moreIcon.topAnchor.constraint(equalTo: primaryView.topAnchor,constant: 6).isActive = true
        
        primaryView.addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: primaryView.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: primaryView.bottomAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: moreIcon.leadingAnchor,constant: -8).isActive = true
        
        primaryView.addSubview(quantityLabel)
        quantityLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 8).isActive = true
        quantityLabel.topAnchor.constraint(equalTo: primaryView.topAnchor).isActive = true
        quantityLabel.bottomAnchor.constraint(equalTo: primaryView.bottomAnchor).isActive = true
        quantityLabel.trailingAnchor.constraint(equalTo: moreIcon.leadingAnchor,constant: -8).isActive = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
