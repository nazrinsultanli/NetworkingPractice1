//
//  UserPageViewController.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import UIKit

class UserPageViewController: UIViewController {

    @IBOutlet weak var tableViewm: UITableView!
    var viewModel = UsersPageViewModel(netWorkManager: NetworkManager.shared)
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getUsers {
            DispatchQueue.main.async {
                self.tableViewm.reloadData()
            }
        }
    }
}

extension UserPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewm.dequeueReusableCell(withIdentifier: "UserPageTableViewCell", for: indexPath) as! UserPageTableViewCell
        cell.emailLabel.text = viewModel.userItems?[indexPath.row].email
        cell.nameLabel.text = viewModel.userItems?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cv = storyboard?.instantiateViewController(withIdentifier: "SingleUserPageViewController") as! SingleUserPageViewController
        
        // Safely unwrap user
        if let user = viewModel.userItems?[indexPath.row] {
            cv.setSingleUser(with: user)
            navigationController?.show(cv, sender: nil)
        } else {
            // Handle the case when user is nil, perhaps log an error or display a message
            print("Error: Selected user is nil.")
        }
    }

}
