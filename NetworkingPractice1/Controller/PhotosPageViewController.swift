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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cv = storyboard?.instantiateViewController(identifier: "SinglePhotoPageViewController") as! SinglePhotoPageViewController
        cv.configure(thumbnailUrl: viewModel.photoItems?[indexPath.row].thumbnailUrl ?? "")
        navigationController?.show(cv, sender: nil)
    }
}
