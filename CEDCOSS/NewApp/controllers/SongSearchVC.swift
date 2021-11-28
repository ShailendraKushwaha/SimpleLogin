//
//  SongSearchVC.swift
//  NewApp
//
//  Created by SHAILENDRA KUSHWAHA on 24/11/21.
//

import UIKit

class SongSearchVC: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var songs :[Song] = [Song]()
    var filteredSong :[Song] = [Song]()
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.reuseIdentifier)
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Songs"
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: ListCell.reuseIdentifier, for: indexPath) as? ListCell else {
            fatalError("Error: Cell")
        }
        cell.awakeFromNib()
        cell.song = songs[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SongDetailVC()
        vc.song = songs[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    func filterContentForSearchText(_ searchText: String) {
//      filteredSong = songs.filter { (song: Song) -> Bool in
//        return song.name!.lowercased().contains(searchText.lowercased())
//      }
//
//      tableView.reloadData()
//    }
    
    private func getSongsFromITunes(searchText:String){
        
        guard let query = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        let url = "https://itunes.apple.com/search?term=\(query)"
        
        APIHandler.sharedInstance.getAPI(url: url, onSuccess: {songs in
            DispatchQueue.main.async {
                
                if let results =  songs["results"] as? NSArray {
                    
                    for result in results {
            
                        if let songInfo = result as? NSDictionary {
                            
                            print(songInfo)
                            let song = Song()
                            if let name = songInfo["trackName"] as? String {
//                                print(name)
                                song.name = name
                            }
                            
                            if let image = songInfo["artworkUrl100"] as? String {
//                                print(image)
                                song.Image = image
                            }
                            
                            if let artistName = songInfo["artistName"] as? String {
//                                print(image)
                                song.artistName = artistName
                            }
                            
                            if let currency = songInfo["currency"] as? String {
//                                print(image)
                                song.currency = currency
                            }
                            
                            if let duration = songInfo["trackTimeMillis"] as? NSNumber {
                                song.durationSeconds = Int(truncating: duration)
                            }
//                            song.trackPrice = songInfo["collectionPrice"] as Float
                            
                            if let price = songInfo["collectionPrice"] as? NSNumber {
//                                print(image)
                                song.trackPrice = Float(truncating: price)
                            }
                            
                            self.songs.append(song)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
            
        }, onFailure: {error in
            
        })
    }

}

extension SongSearchVC : UISearchResultsUpdating {
    
  func updateSearchResults(for searchController: UISearchController) {
      let searchBar = searchController.searchBar
      getSongsFromITunes(searchText: searchBar.text!)
//      filterContentForSearchText(searchBar.text!)
  }

}
