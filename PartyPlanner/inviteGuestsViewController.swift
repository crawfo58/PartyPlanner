//
//  inviteGuestsViewController.swift
//  PartyPlanner
//
//  Created by Manas Bhagoliwal on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit
import Firebase
class inviteGuestsViewController: UIViewController {

    @IBOutlet weak var guestIDTextLabel: UITextField!
    
    var event: Party!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Invite(_ sender: Any) {
        let email = guestIDTextLabel.text
        let newEmail = email?.replacingOccurrences(of: ".", with: ",")
        Database.database().reference().child("users").child(newEmail!).child("events").setValue(self.event.uid)
        
    }
    @IBAction func finalButton(_ sender: Any) {
        self.performSegue(withIdentifier: "finalEntry", sender: nil)
    }

}
