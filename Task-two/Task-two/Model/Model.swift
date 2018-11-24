//
//  Model.swift
//  Task-two
//
//  Created by Любчик on 10/20/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation

class Model: Codable {
    var likesCount: String
    var id: String
    
    init(likesCount : String, id: String) {
        self.id = id
        self.likesCount = likesCount
    }
    
}
