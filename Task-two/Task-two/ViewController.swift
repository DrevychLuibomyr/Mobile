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
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    //MARK: Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.allowsEditingTextAttributes = true
        textField.clearButtonMode = .whileEditing
    }
    
    //MARK: - IBAction
    @IBAction func didTapOnWelcomeButton(_ sender: UIButton) {
        guard let text = textField.text else { return }
        if text.isEmpty{
            let alertController = UIAlertController(title: Constants.alertTitle, message: Constants.alertMessage, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: Constants.alertButtonTitle, style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            welcomeLabel.text = "Hello \(text)"
        }
    }
    
}
