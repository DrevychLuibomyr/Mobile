//
//  ViewController.swift
//  Task-two
//
//  Created by Любчик on 9/6/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit

final class ViewController: UITableViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNickName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userPhoneTextField: UITextField!
    
    lazy var textFields: [UITextField] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        textFields = [firstNameTextField, emailTextField, userPassword, userNickName, userPhoneTextField ]
    }

    @IBAction func validateAllField(_ sender: Any) {
        if validateAllFields()  {
            Manager.setAccountWith(firstName: firstNameTextField.text,
                                   email: emailTextField.text,
                                   nickName: userNickName.text,
                                   phone: userPhoneTextField.text,
                                   password: userPassword.text)
            print("We did it")
        } else {
            AlertHelper.showAlert(on: self,
                                  title: Constants.alertTitle,
                                  message: Constants.alertNotValidFiledsMessage,
                                  buttonTitle: Constants.alertButtonTitle,
                                  buttonAction: { }, showCancelButton: false)
        }
    }
    
    private func validateAllFields() -> Bool {
    
        if textFields.isEmpty {
            return false
        }
        
        if isValidEmail(firstNameTextField.text!) {
            print("Email is valid")
        } else {
            return false
        }
        
        if isValidUserPhone(emailTextField.text!) {
            print("Phone number valid")
        } else {
            return false
        }
        
        if validateUserNick(userNickName.text!) {
            print("Phone number valid")
        } else {
            return false
        }
        
        if validateUserName(firstNameTextField.text!) {
            print("Phone number valid")
        } else {
            return false
        }
        
        if validatePassword(userPassword.text!) {
            print("Phone number valid")
        } else {
            return false
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        guard let regex = try? NSRegularExpression(pattern: emailRegex, options: []) else { return false }
        return regex.matches(in: email, options: [], range: NSMakeRange(0, email.count)).count > 0
    }
    
    private func isValidUserPhone(_ value: String) -> Bool {
        let phoneRegex = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    private func validatePassword(_ password: String) -> Bool {
        return !password.isEmpty && password.count >= 8
    }
    
    private func validateUserNick(_ userNickName: String) -> Bool {
        return !userNickName.isEmpty
    }
    
    private func validateUserName(_ userName: String) -> Bool {
        return !userName.isEmpty
    }
    
}





