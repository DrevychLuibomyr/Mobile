//
//  Model.swift
//  Task-two
//
//  Created by Любчик on 10/20/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation

class Model: Codable {
    var firstName: String
    var secondName: String
    var email: String
    
    init(firstName : String, secondName: String, email : String) {
        self.firstName = firstName
        self.secondName = secondName
        self.email = email
    }
    
}
