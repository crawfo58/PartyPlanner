//
//  newEventViewController.swift
//  PartyPlanner
//
//  Created by Manas Bhagoliwal on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit
import Firebase
class newEventViewController: UIViewController {
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventDate: UITextField!
    @IBOutlet weak var eventLoc: UITextField!

    
    @IBAction func newEventNext(_ sender: Any) {
        let uuid = UUID().uuidString
        var event = Party(name: eventName.text!, date: eventDate.text!, location: eventLoc.text!, itemsNeeded: [], uid: uuid)
        self.performSegue(withIdentifier: "itemsNeeded", sender: event)
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
        let event = sender as! Party
        let destination = segue.destination as! ItemsNeededViewController
        destination.event = event
        
    }

}
