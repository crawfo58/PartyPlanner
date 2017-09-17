//
//  ViewController.swift
//  PartyPlanner
//
//  Created by Manas Bhagoliwal on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func Login(_ sender: Any) {
            Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
                if let error = error {
                    let myAlert = UIAlertController(title:"Alert", message:"Username does not exist!", preferredStyle: UIAlertControllerStyle.alert);
                    
                    let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
                    
                    myAlert.addAction(okAction);
                    
                    self.present(myAlert, animated:true, completion:nil);
                    print(error.localizedDescription)
                    return
                }
                
                else {

                    self.performSegue(withIdentifier: "loginSegue", sender: nil)}
                
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

