//
//  PhotosPageViewController.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import UIKit

class PhotosPageViewController: UIViewController {
    @IBOutlet weak var tableViewm: UITableView!
    var viewModel = PhotosPageViewModel(netWorkManager: NetworkManager.shared)
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPhotos {
            DispatchQueue.main.async {
                self.tableViewm.reloadData()
            }
        }
    }
}

extension PhotosPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.photoItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewm.dequeueReusableCell(withIdentifier: "PhotoPageTableViewCell", for: indexPath) as! PhotoPageTableViewCell
        if let photo = viewModel.photoItems?[indexPath.row]{
            cell.configure(with: photo)
        }
        return cell
    }
    
    
}
