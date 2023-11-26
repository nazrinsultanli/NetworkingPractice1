//
//  PhotoPageTableViewCell.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import UIKit

class PhotoPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with photo: Photo) {
            photoName.text = photo.title
        if let thumbnailUrl = URL(string: photo.thumbnailUrl ?? "") {
                // Load image from URL using URLSession
                URLSession.shared.dataTask(with: thumbnailUrl) { (data, _, error) in
                    if let error = error {
                        print("Error loading image: \(error.localizedDescription)")
                    } else if let data = data {
                        DispatchQueue.main.async {
                            self.photoImage.image = UIImage(data: data)
                        }
                    }
                }.resume()
            }
        }

}
