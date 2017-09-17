//
//  ItemsNeededViewController.swift
//  PartyPlanner
//
//  Created by Manas Bhagoliwal on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit

class ItemsNeededViewController: UIViewController {
    @IBOutlet weak var newItem: UITextField!
    
    var items: [String] = []
    
    var party: Party!
    @IBAction func nextItem(_ sender: Any) {
        items.append(newItem.text!)
        newItem.text = ""
    }
    @IBAction func toInvitation(_ sender: Any) {
        party.itemsNeeded = items
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
