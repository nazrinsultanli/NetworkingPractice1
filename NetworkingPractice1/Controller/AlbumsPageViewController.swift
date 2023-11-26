//
//  AlbumsPageViewController.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import UIKit

class AlbumsPageViewController: UIViewController {

    @IBOutlet weak var tableViewm: UITableView!
    var viewModel = AlbumsPageViewModel(netWorkManager: NetworkManager.shared)
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAlbums {
            DispatchQueue.main.async {
                self.tableViewm.reloadData()
            }
        }
    }
}

extension AlbumsPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.albumItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewm.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel.albumItems?[indexPath.row].title
        return cell
    }
    
    
}
