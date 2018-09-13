//
//  ViewController.swift
//  Task-two
//
//  Created by Любчик on 9/6/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    //MARK: Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.allowsEditingTextAttributes = true
        nameTextField.clearButtonMode = .whileEditing
    }
    
    //MARK: - IBAction
    @IBAction func didTapOnWelcomeButton(_ sender: UIButton) {
        guard let text = nameTextField.text else { return }
        if text.isEmpty{
            AlertHelper.showAlert(on: self,
                                  title: Constants.alertTitle,
                                  message: Constants.alertMessage,
                                  buttonTitle: Constants.alertButtonTitle,
                                  buttonAction: { }, showCancelButton: false)
        } else {
            welcomeLabel.text = "Hello \(text)"
        }
    }
    
}
