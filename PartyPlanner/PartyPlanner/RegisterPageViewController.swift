//
//  RegisterPageViewController.swift
//  PartyPlanner
//
//  Created by Manas Bhagoliwal on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let UserName = userNameTextField.text;
        let password = passwordTextField.text;
        let repassword = repasswordTextField.text;
        
        
        // Check for empty fields
        
        
        if( (UserName?.isEmpty)! || (password?.isEmpty)! || (repassword?.isEmpty)!){
            
            // Display error message
            MyerrorMessage(userMessage: "All fields are required!");
            return;
        }
        if(password != repassword){
            
            // Display error message
            MyerrorMessage(userMessage: "Passwords do not match!")
            return;
        }
        
        
        
        
    }

    func MyerrorMessage(userMessage:String)
    {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true, completion:nil);
        }
    
    @IBAction func iHaveAnAccountButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

