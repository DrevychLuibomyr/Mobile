//
//  Manager.swift
//  Task-two
//
//  Created by Любчик on 10/20/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation

class Manager {
    
    static func getPersons() -> [Model] {
        if let placeData = UserDefaults.standard.data(forKey: Constants.modelKey) {
            guard let placeArray = try? JSONDecoder().decode([Model].self, from: placeData) else { return [] }
            return placeArray
        } else {
            return []
        }
    }
    
    static func submitDataWith(model: Model) {
        var models: [Model] = []
        if isKeyPresentInUserDefaults() {
            models = Manager.getPersons()
            models.append(model)
            let placesData = try? JSONEncoder().encode(models)
            UserDefaults.standard.removeObject(forKey: Constants.modelKey)
            UserDefaults.standard.set(placesData, forKey: Constants.modelKey)
            UserDefaults.standard.synchronize()
        } else if (isKeyPresentInUserDefaults() != true){
            models.append(model)
            let placesData = try? JSONEncoder().encode(models)
            UserDefaults.standard.set(placesData, forKey: Constants.modelKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func removeFromUserDefaults() {
        UserDefaults.standard.removeObject(forKey: Constants.modelKey)
    }
    
    static func isKeyPresentInUserDefaults() -> Bool {
        return UserDefaults.standard.object(forKey: Constants.modelKey) != nil
    }
    
}
