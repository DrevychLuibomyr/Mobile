//
//  Manager.swift
//  Task-two
//
//  Created by Любчик on 9/20/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation

class Manager {
    
    static func setAccountWith(firstName: String?, email: String?, nickName: String?, phone: String?, password: String?) {
        // This is a tutorial on Regular Expressions, not Authentication. Don't ever do this in real life!
        UserDefaults.standard.set(firstName, forKey: Constants.firstName)
        UserDefaults.standard.set(email, forKey: Constants.email)
        UserDefaults.standard.set(nickName, forKey: Constants.nickName)
        UserDefaults.standard.set(phone, forKey: Constants.phone)
        UserDefaults.standard.set(password, forKey: Constants.password)
    }
    
    static func getFirstName() -> String? {
        return UserDefaults.standard.string(forKey: Constants.firstName)
    }
    
    static func getEmail() -> String? {
        return UserDefaults.standard.string(forKey: Constants.email)
    }
    
    static func getLastName() -> String? {
        return UserDefaults.standard.string(forKey: Constants.nickName)
    }
    
    static func getPhone() -> String? {
        return UserDefaults.standard.string(forKey: Constants.phone)
    }
    
    static func getPassword() -> String? {
        return UserDefaults.standard.string(forKey: Constants.password)
    }
    
}
