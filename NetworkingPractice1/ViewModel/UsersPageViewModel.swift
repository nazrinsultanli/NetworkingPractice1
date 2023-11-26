//
//  UsersPageViewModel.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import Foundation
final class UsersPageViewModel {
    var userItems: [User]?
    private var netWorkManager: NetworkManager
    init(netWorkManager: NetworkManager){
        self.netWorkManager = netWorkManager
    }
    
    func getUsers(completion: @escaping () -> Void){
        netWorkManager.getObjects(type: [User].self,
                                  urlParameter: urlEnd.users.rawValue){[weak self] result in
            switch result {
            case .success(let users):
                self?.userItems = users
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
