//
//  ViewController.swift
//  Live Alert
//
//  Created by Akshat Gupta on 27/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class splashScreenVC : UIViewController {
    var timer = Timer()
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeScreen), userInfo: nil, repeats: false)
        
        
    }

   
  
    @objc func changeScreen(){
        loader.stopAnimating()
        performSegue(withIdentifier: "showTabBar", sender: Any?.self)
    }
}

