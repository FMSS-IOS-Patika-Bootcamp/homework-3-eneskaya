//
//  Webservice.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 23.09.2022.
//

import Foundation

class Webservice{
    
    func downloadPosts(url: URL, completion: @escaping ([PostElement]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let postList = try? JSONDecoder().decode([PostElement].self, from: data)
                print(postList ?? "nil")
                
                if let postList = postList {
                    completion(postList)
                }
                
            }
        }.resume()
    }
    
/*    func downloadPhotos(url: URL, completion: @escaping ([PhotoModel]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let photoList = try? JSONDecoder().decode([PhotoModel].self, from: data)
                print(photoList ?? "nil")
                
                if let photoList = photoList {
                    completion(photoList)
                }
                
            }
        }.resume()
    }
    
    */
    
}
