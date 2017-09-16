//
//  PartyCreatorViewController.swift
//  PartyPlanner
//
//  Created by Max Cohen on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit

class PartyCreatorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var partyList: UITableView!
    @IBAction func addParty(_ sender: Any) {
        
    }
    var parties: [Party] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        partyList.delegate = self
        partyList.dataSource = self
        loadFromInternet()
    }
    
    func loadFromInternet() {
        // TODO load data from internet
        var test: [String] = []
        let party1 = Party(name: "Max Cohen", date: "12/09/2017", location: "512 Main St. New York City", itemsNeeded: test)
        let party2 = Party(name: "Bruce Wayne", date: "8/09/1997", location: "Wayne Manor, Gotham City", itemsNeeded: test)
        let party3 = Party(name:"Clark Kent", date:"5/6/2021", location: "898 blue st., Smallville, Kansas", itemsNeeded: test)
        
        parties.append(party1)
        parties.append(party2)
        parties.append(party3)
        
        partyList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parties.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as! PartyCell
        
        var party = parties[indexPath.row]
        
        cell.nameLabel.text = party.name
        cell.dateLabel.text = party.date
        cell.locationLabel.text = party.location
        
        return cell
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
