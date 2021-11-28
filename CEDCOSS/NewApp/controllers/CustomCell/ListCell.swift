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
    
    private var iconView : AlbumImageView = {
        let view = AlbumImageView()
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
        view.font = UIFont.systemFont(ofSize: 14)
        return view
    }()
    
    private var artistLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.textColor = .gray
        view.font = UIFont.systemFont(ofSize: 13)
        return view
    }()
    
    private var priceLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 13)
        return view
    }()
    
    var song : Song? {
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
        iconView.topAnchor.constraint(equalTo: primaryView.topAnchor,constant: 4).isActive = true
        
       
        primaryView.addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: primaryView.topAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
//        nameLabel.bottomAnchor.constraint(equalTo: primaryView.bottomAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: primaryView.trailingAnchor,constant: -8).isActive = true
        
        primaryView.addSubview(artistLabel)
        artistLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 8).isActive = true
        artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 10).isActive = true
        artistLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
//        nameLabel.bottomAnchor.constraint(equalTo: primaryView.bottomAnchor).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: primaryView.trailingAnchor,constant: -8).isActive = true
        
        primaryView.addSubview(priceLabel)
        priceLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 8).isActive = true
        priceLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
//        nameLabel.bottomAnchor.constraint(equalTo: primaryView.bottomAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: primaryView.trailingAnchor,constant: -8).isActive = true
        
        
    }
    
    private func setValues(){
        
        guard let song = self.song else {
            return
        }
        
        self.iconView.setImageViaURL(url: song.Image ?? "")
        self.nameLabel.text = song.name
        self.artistLabel.text = song.artistName
        
        self.priceLabel.text  = song.currency! + String(song.trackPrice ?? 0.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
