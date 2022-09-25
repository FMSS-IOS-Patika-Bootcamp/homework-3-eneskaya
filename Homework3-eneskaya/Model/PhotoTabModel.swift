//
//  PhotoTabModel.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 25.09.2022.
//

import Foundation


protocol PhotoModelPr: AnyObject {
    func getData(_ isSuccess: Bool)
}


class photoModel {
    
    
    weak var photoDelegate: PhotoModelPr?
    var photos: [Photo] = []
    
    
    func fetchDataFunc() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            photoDelegate?.getData(false)
            return }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else {
                return }
            
            guard error == nil else {
                self.photoDelegate?.getData(false)
                
                return
            }
            
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            guard
                statusCode >= 200,
                statusCode < 300
            else {
                self.photoDelegate?.getData(false)
                
                return
            }
            
            guard let data = data else {
                self.photoDelegate?.getData(false)
                
                return
                
            }
          
            do {
                let jsonDecoder = JSONDecoder()
                
                self.photos = try jsonDecoder.decode([Photo].self, from: data)
                
                self.photoDelegate?.getData(true)
                
            } catch {
                print(error.localizedDescription)
                self.photoDelegate?.getData(false)
            }
        }
        
        task.resume()
    }
}
