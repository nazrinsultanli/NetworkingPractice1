//
//  CommentPageViewModel.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import Foundation

final class CommentPageViewModel{
    var postId = 0
    var commentItems: [Comment]?
    private let netWorkManager: NetworkManager
    
    init(netWorkManager: NetworkManager){
        self.netWorkManager = netWorkManager
    }
    
    func getComment(completion: @escaping ()-> Void){
        netWorkManager.getObjects(
            type: [Comment].self,
            urlParameter: urlEnd.comments.rawValue 
        ) { [weak self]  result in
            switch result {
            case .success(let comments):
                self?.commentItems = comments
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
