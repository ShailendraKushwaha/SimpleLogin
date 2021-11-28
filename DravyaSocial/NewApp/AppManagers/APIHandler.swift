//
//  APIHandler.swift
//  NewApp
//
//  Created by SHAILENDRA KUSHWAHA on 30/10/21.
//


import Foundation
import UIKit


class APIHandler: NSObject {
        
    static let sharedInstance = APIHandler()

    func RequestManager(url: String!, method: String!) -> URLRequest  {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData

        return request
    }

    func getAPI(url: String!, onSuccess: @escaping(NSArray) -> Void, onFailure: @escaping(Error) -> Void) {
        
        guard let url  = URL(string:url) else {
            print("Error: URL not valid")
            return
        }
        
        let request = self.RequestManager(url: url.absoluteString, method: "GET")
 
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in

            do {
                
    
                if (data == nil){
                    onFailure(error!)
                }
                else {
                    
                    let result = try JSONSerialization.jsonObject(with: data!) as! NSArray
               
                    onSuccess(result)

                }
            } catch {
                onFailure(error)
            }
        })
        
        task.resume()
    }
    
}

