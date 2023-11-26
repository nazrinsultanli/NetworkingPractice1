//
//  PostPageViewModel.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 25.11.23.
//

import Foundation

final class PostPageViewModel {
    var postItems: [Post]?
    private let netWorkManager: NetworkManager
    init(netWorkManager: NetworkManager){
        self.netWorkManager = netWorkManager
    }
    
    func getPost(completion: @escaping () -> Void){
        netWorkManager.getObjects(type: [Post].self,
                                  urlParameter:  urlEnd.post.rawValue) { [weak self] result in
            switch result {
            case .success(let posts):
                self?.postItems = posts
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
