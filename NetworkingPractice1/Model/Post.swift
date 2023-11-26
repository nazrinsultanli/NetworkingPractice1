//
//  Post.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 25.11.23.
//

import Foundation
struct Post: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
