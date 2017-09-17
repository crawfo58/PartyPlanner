//
//  ItemsNeededViewController.swift
//  PartyPlanner
//
//  Created by Manas Bhagoliwal on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit
import Firebase

class ItemsNeededViewController: UIViewController {
    @IBOutlet weak var newItem: UITextField!
    
    var items: [String] = []
    
    var event: Party!
    @IBAction func nextItem(_ sender: Any) {
        items.append(newItem.text!)
        newItem.text=""
        
    }
    @IBAction func toInvitation(_ sender: Any) {
        items.append(newItem.text!)
        event.itemsNeeded = items
        
        var dict = Dictionary<String, Any>()
        
       // Database.database().reference().child("events").child(event.uid).setValue("placeholder")
        
        dict["name"] = event.name
        dict["date"] = event.date
        dict["location"] = event.location
        dict["items"] = items
        dict["uid"] = event.uid
        
        Database.database().reference().child("events").child(event.uid).setValue(dict)

        //Database.database().reference().child("events").child(event.uid).child("name").setValue(event.name)
        //Database.database().reference().child("events").child(event.uid).child("date").setValue(event.date)
        //Database.database().reference().child("events").child(event.uid).child("location").setValue(event.location)
        //Database.database().reference().child("events").child(event.uid).setValue(items)
        let userId = Auth.auth().currentUser?.email
         let test = userId!.replacingOccurrences(of: ".", with: ",")
        Database.database().reference().child("users").child(test).child("events").setValue(event.uid)
        self.performSegue(withIdentifier: "inviteGuests", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! inviteGuestsViewController
        destination.event = event

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }

}
