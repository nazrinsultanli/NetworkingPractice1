//
//  CommentPageViewController.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import UIKit

class CommentPageViewController: UIViewController {
    @IBOutlet weak var tableViewm: UITableView!
    var viewModel = CommentPageViewModel(netWorkManager: NetworkManager.shared)
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getComment {
            DispatchQueue.main.async {
                self.tableViewm.reloadData()
            }
        }
    }

}

extension CommentPageViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.commentItems?.filter({$0.postId == viewModel.postId}).count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewm.dequeueReusableCell(withIdentifier: "CommentPageTableCell", for: indexPath) as! CommentPageTableCell
        cell.name.text = viewModel.commentItems?.filter({$0.postId == viewModel.postId})[indexPath.row].name
        cell.body.text = viewModel.commentItems?.filter({$0.postId == viewModel.postId})[indexPath.row].body
        cell.email.text = viewModel.commentItems?.filter({$0.postId == viewModel.postId})[indexPath.row].email
        return cell
    }
}
