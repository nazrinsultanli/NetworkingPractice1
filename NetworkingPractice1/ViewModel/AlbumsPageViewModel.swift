//
//  AlbumsPageViewModel.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import Foundation

final class AlbumsPageViewModel {
    var albumItems: [Album]?
    private let netWorkManager: NetworkManager
    init(netWorkManager: NetworkManager){
        self.netWorkManager = netWorkManager
    }
    
    func getAlbums(completion: @escaping () -> Void){
        netWorkManager.getObjects(type: [Album].self,
                                  urlParameter: urlEnd.albums.rawValue){
            [weak self] result in
            switch result {
            case .success(let albums):
                self?.albumItems = albums
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
