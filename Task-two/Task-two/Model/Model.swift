//
//  Model.swift
//  Task-two
//
//  Created by Любчик on 10/20/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation

class Model: Codable {
    var farm: String
    var server: String
    var secret: String
    var id: String
    
    init(farm : String, server: String, secret: String, id: String) {
        self.farm = farm
        self.server = server
        self.secret = secret
        self.id = id
    }
    
}
