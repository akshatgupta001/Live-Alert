//
//  LoginVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 27/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func SignPressed(_ sender: Any) {
        performSegue(withIdentifier: "showTabBar", sender: self)
    }
    
    

}
