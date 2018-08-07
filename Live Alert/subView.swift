//
//  navBar.swift
//  Live Alert
//
//  Created by Akshat Gupta on 31/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit


class subView: UIViewController {
    let navbar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 50));

    public func setTitle(title : String){
         let navItem = UINavigationItem(title: title)
        
      
        
       let alertBtn = UIButton(type: UIButtonType.custom)
        alertBtn.setImage(#imageLiteral(resourceName: "alert-1"), for: .normal)
        alertBtn.frame = CGRect(x: 100, y: 0, width: 80, height: 50)
        alertBtn.addTarget(self, action: #selector(alertsPressed), for: UIControlEvents.touchUpInside)
        
//        let AlertBox = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
//        AlertBox.text = "Alert"
//        AlertBox.textAlignment = .right
//        AlertBox.sizeToFit()
        
        let modeBtn = UIButton(type: UIButtonType.custom)
        modeBtn.setImage(#imageLiteral(resourceName: "standby"), for: .normal)
        modeBtn.frame = CGRect(x: 0, y: 0, width: 80, height: 50)
        modeBtn.sizeToFit()
        modeBtn.addTarget(self, action: #selector(modePressed), for: UIControlEvents.touchUpInside)
         navItem.leftBarButtonItem = UIBarButtonItem(customView: modeBtn)
        
        navItem.rightBarButtonItems = [UIBarButtonItem(customView: alertBtn)]
        navbar.items = [navItem]
         

    }
    override func viewDidLoad() {
        super.viewDidLoad()

       self.view.addSubview(navbar)
       
    }
    @objc func alertsPressed(){
        performSegue(withIdentifier: "showAlert", sender: (Any).self)
    }
    @objc func modePressed(){
        performSegue(withIdentifier: "showMode", sender: (Any).self)
    }
}



