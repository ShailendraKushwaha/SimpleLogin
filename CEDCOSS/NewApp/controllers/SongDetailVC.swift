//
//  SongDetailVC.swift
//  NewApp
//
//  Created by SHAILENDRA KUSHWAHA on 24/11/21.
//

import UIKit

class SongDetailVC: UIViewController {

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
    
    private var durationLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = .red
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    var song : Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let width = UIScreen.main.bounds.width - 32
        
        self.view.addSubview(iconView)
        iconView.widthAnchor.constraint(equalToConstant: width).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: width).isActive = true
        iconView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16).isActive = true
        iconView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        self.view.addSubview(durationLabel)
        durationLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        durationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        durationLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor).isActive = true
        durationLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16).isActive = true
        
        self.view.addSubview(nameLabel)
        nameLabel.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor,constant: 24).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16).isActive = true
        
        self.view.addSubview(artistLabel)
        artistLabel.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        artistLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 6).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16).isActive = true
        
        self.view.addSubview(priceLabel)
        priceLabel.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        priceLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let song = self.song else {
            return
        }
        
        self.iconView.setImageViaURL(url: song.Image ?? "")
        self.nameLabel.text = song.name
        self.artistLabel.text = song.artistName
        self.priceLabel.text  = song.currency! + String(song.trackPrice!)
        
        self.durationLabel.text = "duration: --:--"
        
        guard let duration = song.durationSeconds else {
            return
        }
        
        let minutes =  (duration / 1000) / 60
        self.durationLabel.text = "duration:-" + minutes.description
    }
    
}
