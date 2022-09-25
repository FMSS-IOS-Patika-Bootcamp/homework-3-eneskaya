//
//  PostViewModel.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 25.09.2022.
//

import Foundation

//View model for post feed tab
struct PostListViewModel {

    let postList : [PostElement]
    
    func numberOfRowsInSection() -> Int {
        return self.postList.count
    }
    func postAtIndex(_ index: Int) -> PostViewModel{
        let post = self.postList[index]
        return PostViewModel(post: post)
    }

}

struct PostViewModel {
    let post : PostElement
    
    var postTitle : String {
        return self.post.title
    }
    
    var postBody : String{
        return self.post.body
    }
    
    var postID : Int {
        return self.post.id
    }
    
    var postUserID : Int {
        return self.post.userID
    }
    
}
