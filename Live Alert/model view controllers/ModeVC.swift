//
//  ModeVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 07/08/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class ModeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action:  #selector(close))
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func close(){
        dismiss(animated: true, completion: nil)
    }

   
}
