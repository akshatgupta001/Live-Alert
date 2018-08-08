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
     let modeBtn = UIButton(type: UIButtonType.custom)
    
    
    
    public func setTitle(title : String){
         let navItem = UINavigationItem(title: title)
       let alertBtn = UIButton(type: UIButtonType.custom)
        alertBtn.setImage(#imageLiteral(resourceName: "alert-1"), for: .normal)
        alertBtn.frame = CGRect(x: 100, y: 0, width: 80, height: 50)
        alertBtn.addTarget(self, action: #selector(alertsPressed), for: UIControlEvents.touchUpInside)
       
        modeBtn.backgroundColor = UIColor.black
        if let mode = UserDefaults.standard.string(forKey: "mode"){
            modeBtn.setTitle(mode, for: .normal)
        }
        else{
            modeBtn.setTitle("standby", for: .normal)
        }
        modeBtn.setTitleColor(UIColor.white, for: .normal)
        modeBtn.titleLabel?.font = UIFont(name: "Avenir Next", size: 13)
       
        modeBtn.frame = CGRect(x: 0, y: 5, width: 80, height: 30)
        modeBtn.layer.cornerRadius = modeBtn.frame.height/10
        modeBtn.clipsToBounds = true
        modeBtn.addTarget(self, action: #selector(modePressed), for: UIControlEvents.touchUpInside)
         navItem.leftBarButtonItem = UIBarButtonItem(customView: modeBtn)
        
        navItem.rightBarButtonItems = [UIBarButtonItem(customView: alertBtn)]
        navbar.items = [navItem]
         

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        changeMode()
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
    func changeMode(){
        if let mode = UserDefaults.standard.string(forKey: "mode"){
            self.modeBtn.setTitle(mode, for: .normal)
        }
        else{
            self.modeBtn.setTitle("standby", for: .normal)
        }
    }
}



