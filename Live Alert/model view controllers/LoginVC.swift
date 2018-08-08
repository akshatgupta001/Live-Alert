//
//  LoginVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 27/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(dismissPicker))
//    self.username.inputAccessoryView = toolBar
    override func viewDidLoad() {
        super.viewDidLoad()
        self.username.inputAccessoryView = toolBar
        self.password.inputAccessoryView = toolBar
        // Do any additional setup after loading the view.
    }
    @objc func dismissPicker() {
        
        
        //self.view.endEditing(true)
        
        print("exit")
        
    }
    @IBAction func SignPressed(_ sender: Any) {
        performSegue(withIdentifier: "showLogo", sender: self)
    }
    
   
    

}
extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}
