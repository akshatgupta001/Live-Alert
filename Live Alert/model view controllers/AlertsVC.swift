//
//  AlertsVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 31/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class AlertsVC: UITableViewController {
     

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      navBar.prefersLargeTitles = true
    }
   
  
}
