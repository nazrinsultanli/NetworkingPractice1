//
//  SingleUserPageViewController.swift
//  NetworkingPractice1
//
//  Created by Nazrin Sultanlı on 26.11.23.
//

import UIKit

class SingleUserPageViewController: UIViewController {

    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func setSingleUser(with user: User){
        print("Street: \(String(describing: user.address?.street))")
        print("Company Name: \(String(describing: user.company?.name))")
        print("Phone: \(String(describing: user.phone))")
        print("Email: \(String(describing: user.email))")
        print("Name: \(String(describing: user.name))")
        
        // Set the values to labels
        adress.text = String(describing: user.address?.street)
        companyName.text = String(describing: user.company?.name)
        phoneNumber.text = String(describing: user.phone)
        emailLabel.text = String(describing: user.email)
        userName.text = String(describing: user.name)
    }



}
