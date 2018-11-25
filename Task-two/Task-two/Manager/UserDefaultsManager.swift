//
//  Manager.swift
//  Task-two
//
//  Created by Любчик on 10/20/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation

class Manager {
    
     func getPersons() -> [Model] {
        if let placeData = UserDefaults.standard.data(forKey: Constants.modelKey) {
            guard let placeArray = try? JSONDecoder().decode([Model].self, from: placeData) else { return [] }
            return placeArray
        } else {
            return []
        }
    }
    
     func submitDataWith(model: Model) {
        var models: [Model] = []
        let manager = Manager()
        if isKeyPresentInUserDefaults() {
            models = manager.getPersons()
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
    
     func removeFromUserDefaults() {
        UserDefaults.standard.removeObject(forKey: Constants.modelKey)
    }
    
     func isKeyPresentInUserDefaults() -> Bool {
        return UserDefaults.standard.object(forKey: Constants.modelKey) != nil
    }
    
}
