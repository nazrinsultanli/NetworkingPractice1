//
//  NetworkManager.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 25.11.23.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://jsonplaceholder.typicode.com/"
    
    func getObjects<T: Codable> (
        type: T.Type,
        urlParameter: String = "",
        completion: @escaping (Result<T, Error>) -> Void) {
            guard let url = URL (string: baseUrl + urlParameter) else { return}
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error {
                    completion(.failure(error))
                } else {
                    do {
                        if let data {
                            let items = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(items))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
}


enum urlEnd: String, CaseIterable{
    case post = "posts"
    case albums = "albums"
    case photos = "photos"
    case users = "users"
    case comments = "comments"
}
