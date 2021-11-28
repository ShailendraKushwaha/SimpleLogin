//
//  AlbumImageView.swift
//  NewApp


import Foundation
import UIKit

let imageCache:NSCache<NSString,UIImage> = NSCache()

class AlbumImageView : UIImageView{
    
    public func setImageViaURL(url:String){
        
        self.image = nil
        
        guard let imgURL = URL(string: url) else {
            self.image =  nil
            return
        }
        
        if let image = imageCache.object(forKey: imgURL.absoluteString as NSString)  {
            self.image =  image
            return
        }
        
        let urlRequest = URLRequest(url: imgURL)
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: {data,response,error in
            DispatchQueue.main.async {
                if let data = data {
                    let image = UIImage(data:data)!
                    self.image = image
                    imageCache.setObject(image, forKey: imgURL.absoluteString as NSString)
                }
                else if let error = error {
                    print(error.localizedDescription)
                    self.image = nil
                }
            }
        }).resume()
        
    }
    
}
