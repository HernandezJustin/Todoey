//
//  Item.swift
//  Todoey
//
//  Created by Justin Hernandez on 10/4/18.
//  Copyright © 2018 jHernandez. All rights reserved.
//

import Foundation

class Item {
    var title : String
    var done : Bool
    
    init(itemTitle : String) {
        self.title = itemTitle
        self.done = false
    }
}
