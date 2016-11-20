//
//  FirstViewController.swift
//  medHacks
//
//  Created by Justice Marks on 11/19/16.
//  Copyright © 2016 MedHackBucks. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
class LoginViewController: UIViewController {

    // Mark: properties
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
   
        
    
    
    @IBAction func loginButton(_ sender: Any) {
        print("Button Clicked")
        
       //authorize user and set user ID
    
        if (userAuthentication(Username: self.usernameField.text!, Password: self.passwordField.text!)) {
            print("user authenticated")
                performSegue(withIdentifier: "loginSegue", sender: self)
            print("segue performed")
                    }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       self.hideKeyboardWhenTappedAround()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


