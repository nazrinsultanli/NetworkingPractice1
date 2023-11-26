//
//  SinglePhotoPageViewController.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import UIKit

class SinglePhotoPageViewController: UIViewController {

    @IBOutlet weak var singleImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    func configure(thumbnailUrl: String) {
        if let thumbnailUrl = URL(string: thumbnailUrl ) {
                URLSession.shared.dataTask(with: thumbnailUrl) { (data, _, error) in
                    if let error = error {
                        print("Error loading image: \(error.localizedDescription)")
                    } else if let data = data {
                        DispatchQueue.main.async {
                            self.singleImage.image = UIImage(data: data)
                        }
                    }
                }.resume()
            }
        }

}
