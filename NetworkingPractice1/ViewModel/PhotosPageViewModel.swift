//
//  PhotosPageViewModel.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import Foundation
final class PhotosPageViewModel {
    var photoItems: [Photo]?
    private let netWorkManager: NetworkManager
    init(netWorkManager: NetworkManager){
        self.netWorkManager = netWorkManager
    }
    
    func getPhotos( completion: @escaping () -> Void) {
        netWorkManager.getObjects(type: [Photo].self,
                                  urlParameter: urlEnd.photos.rawValue){ [weak self] result in
            switch result {
            case .success(let photos):
                self?.photoItems = photos
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
