//
//  Party.swift
//  PartyPlanner
//
//  Created by Max Cohen on 9/16/17.
//  Copyright © 2017 Manas Bhagoliwal. All rights reserved.
//

import UIKit

class Party: NSObject {
    var name: String = ""
    var date: String = ""
    var location: String = ""
    var itemsNeeded: [String] = []
    
    init(name: String, date: String, location: String, itemsNeeded: [String]) {
        super.init()
        self.name = name
        self.date = date
        self.location = location
        self.itemsNeeded = itemsNeeded
    }
    
}
