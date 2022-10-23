//
//  ViewController.swift
//  InstagramApp3
//
//  Created by Huu Thanh on 23/10/2022.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        handleNotAuthenticated()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func handleNotAuthenticated() {
        // check Auth status
        if Auth.auth().currentUser == nil {
        //show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }

}

