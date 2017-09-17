//
//  RegisterPageViewController.swift
//  PartyPlanner
//
//  Created by Manas Bhagoliwal on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit
import Firebase

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
            MyerrorMessage(userMessage: "All fields are required")
            return;
        }
        if(password != repassword){
            
            // Display error message
            MyerrorMessage(userMessage:"Passwords do not match")
            return;
        }
        Auth.auth().createUser(withEmail: UserName!, password: password!) { (user, error) in
            // [START_EXCLUDE]
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("\(user!.email!) created")
            
            let newEmail = UserName!.replacingOccurrences(of: ".", with: ",")
            Database.database().reference().child("users").child(newEmail).setValue("placeholder")
            
            self.performSegue(withIdentifier: "regisegue", sender: nil)
            //Database.database().reference().child("users").child("szaneer@ashifhjdsiouf,com").observeSingleEvent(of:value, with:) { (snapshot) in
            //print(snapshot)
            //let dictionary = snapshot.value as! Dictionary<String, Any>
            //print(dictionary)
            //print(dictionary["events"])
            
        }
    }
    
    // [END_EXCLUDE]
    
    
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
