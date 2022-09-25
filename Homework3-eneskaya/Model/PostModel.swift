//
//  PostModel.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 23.09.2022.
//

import Foundation

//post model struct
struct PostElement: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias WelcomePost = [PostElement]
