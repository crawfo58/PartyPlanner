//
//  FinalViewViewController.swift
//  PartyPlanner
//
//  Created by Manas Bhagoliwal on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit
import Firebase

class FinalViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var event: Party!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet var location: UILabel!
     
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        name.text = event.name
        date.text = event.date
        location.text = event.location
        print(event.itemsNeeded)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.itemsNeeded.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartyNameCell", for: indexPath) as! PartyNameCell
        
       let food = event.itemsNeeded[indexPath.row]
        print(food)
        cell.item.text = food
        return cell
    }
    


}
