//
//  PostPageViewController.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 25.11.23.
//

import UIKit

class PostPageViewController: UIViewController {
    @IBOutlet weak var tableViewm: UITableView!
    var viewModel = PostPageViewModel(netWorkManager: NetworkManager.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getPost {
            DispatchQueue.main.async {
                self.tableViewm.reloadData()
            }
        }
    }
    
}

extension PostPageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.postItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewm.dequeueReusableCell(withIdentifier: "PostPageTableCell", for: indexPath) as! PostPageTableCell
        cell.titleLable.text = viewModel.postItems?[indexPath.row].title
        cell.bodyLabel.text = viewModel.postItems?[indexPath.row].body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cv = storyboard?.instantiateViewController(withIdentifier: "CommentPageViewController") as! CommentPageViewController
        cv.viewModel.postId = viewModel.postItems?[indexPath.row].id ?? 0
        navigationController?.show(cv, sender: nil)
    }
}
