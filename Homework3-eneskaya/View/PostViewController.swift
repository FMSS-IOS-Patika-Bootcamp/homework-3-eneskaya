//
//  PostViewController.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 23.09.2022.
//

import UIKit

// Post view controller

class PostViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   
    private var postListViewModel : PostListViewModel!
    

    @IBOutlet weak var postTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.delegate = self
        postTableView.dataSource = self
        
        postTableView.cellLayoutMarginsFollowReadableWidth = false
        
       
        getData()
    }
    
    func getData() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

        Webservice().downloadPosts(url: url){ (posts) in
            if let posts = posts {
                
                self.postListViewModel = PostListViewModel(postList: posts)
                
                DispatchQueue.main.async {
                    self.postTableView.reloadData()
                }
                
                }
                
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
       
        
        let postViewModel = self.postListViewModel.postAtIndex(indexPath.row)
        
        cell.bodyText.text = postViewModel.postBody
        cell.titleText.text = "Title: \(postViewModel.postTitle)"
        cell.idText.text = "ID: \(postViewModel.postID)"
        cell.userIdText.text = "User ID: \(postViewModel.postUserID)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postListViewModel == nil ? 0 : self.postListViewModel.numberOfRowsInSection()
    }


}
