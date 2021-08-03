//
//  MYListVC.swift
//  NewApp
//
//  Created by SHAILENDRA KUSHWAHA on 30/06/21.
//

import UIKit
import CoreData

class MYListVC: UIViewController {
    
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
        label.text = "My Lists"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 26)
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
    
   lazy var plusButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(self.plusTapped(sender:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 24
        return button
    }()
    
    lazy var listTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.reuseIdentifier)
        
        return tableView
    }()
    
    var listItems : [ListItem] = [ListItem]()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate //Singlton instance
    var context:NSManagedObjectContext!
    
    var categoryName = ["Winter Clothing","Essentials","Baby Cloth"]
    var icons        = ["winter","essential","cloth"]
    var quanitity     = ["1/9","10/12","1/2"]

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
        
        view.addSubview(plusButton)
        plusButton.widthAnchor.constraint(equalToConstant:48).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -32).isActive = true
        
        containerView.addSubview(listTableView)
        listTableView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 44).isActive = true
        listTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        listTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        fetchData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = AppColors.MAIN_COLOR
//        var i: Int = 0
//        for item in categoryName {
//            listItems.append(ListItem(name: item, imageName: icons[i], numbers: quanitity[i]))
//            i += 1
//        }
//
//        listTableView.reloadData()
    }
    
    @objc public func backButtonTapped(sender:Any) {
        self.navigationController?.popViewController(animated:true)
    }
    
    @objc public func plusTapped(sender:Any) {
        self.navigationController?.pushViewController(AddListVC(), animated: true)
    }
    
    func fetchData(){
        
        let context = appDelegate.persistentContainer.viewContext
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject] {
                    let name = data.value(forKey: "name") as! String
                    let icon = data.value(forKey: "icon") as! String
                    let left = data.value(forKey: "left") as! Int
                    let total = data.value(forKey: "total") as! Int
                    self.listItems.append(ListItem(name: name, imageName: icon, numbers: String(String(left) + "/" + String(total))))
                }
            } catch {
                print("Fetching data Failed")
            }
        }
}

extension MYListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.reuseIdentifier, for: indexPath) as? ListCell else {
            fatalError("Cell Error")
        }
        
        cell.awakeFromNib()
        cell.item = listItems[indexPath.row]
        return cell
    }
}


