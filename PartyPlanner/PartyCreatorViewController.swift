
//
//  PartyCreatorViewController.swift
//  PartyPlanner
//
//  Created by Max Cohen on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit
import Firebase
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
        //loadFromInternet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadFromInternet()
    }
    
    func loadFromInternet() {
        
        // TODO load data from internet
        Database.database().reference().child("users").child(Auth.auth().currentUser!.email!.replacingOccurrences(of: ".", with: ",")).child("events").observeSingleEvent(of: .value, with: { (snapshot) in
            let eventsKey = snapshot.value as! String
            print(snapshot)
            Database.database().reference().child("events").child(eventsKey).observeSingleEvent(of: .value, with: {(snapshot) in
            if let info = snapshot.value as? Dictionary<String, Any> {
                            let party = Party(name: info["name"] as! String, date: info["date"] as! String, location: info["location"] as! String, itemsNeeded: info["items"] as! [String], uid: eventsKey)
                                
                            
                            
                            self.parties.append(party)
                            self.partyList.reloadData()
                        }
                    })
            
            
            
            
        })
      
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
        
        let newEvent = parties[indexPath.row]
        
        cell.nameLabel.text = newEvent.name
        cell.dateLabel.text = newEvent.date
        cell.locationLabel.text = newEvent.location
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finalSegue" {
            
            
            print("over here")
            let destination = segue.destination as! FinalViewViewController
            destination.event = parties[0]
            print(parties[0].name)
            print(parties[0].date)
            
            
            
        }
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
