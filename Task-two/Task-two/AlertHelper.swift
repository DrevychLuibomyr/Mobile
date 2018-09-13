//
//  AlertHelper.swift
//  Task-two
//
//  Created by Любчик on 9/13/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit

class AlertHelper {
    static let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    static func showAlert(on owner: UIViewController,
                          title: String? = nil,
                          message: String,
                          buttonTitle: String,
                          buttonAction: @escaping () -> Void,
                          showCancelButton: Bool = true) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        if showCancelButton {
            alertController.addAction(AlertHelper.cancelAction)
        }
        let openAction = UIAlertAction(title: buttonTitle, style: .default) { action in
            buttonAction()
        }
        alertController.addAction(openAction)
        owner.present(alertController, animated: true, completion: nil)
    }
    
}

