//
//  ResultVCPresenter.swift
//  Task-two
//
//  Created by Любчик on 11/25/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation
import UIKit

protocol ResultVCPresenterProtocol {
    func removeData()
    func getData() -> [Model]
}

class ResultVCPresenter: Presenter, ResultVCPresenterProtocol {

    let manager: Manager
    var navigationController: UINavigationController?
    init(manager: Manager) {
        self.manager = manager
    }
    
    func removeData() {
        manager.removeFromUserDefaults()
    }
    
    func getData() -> [Model] {
        return manager.getPersons()
    }
    
    func goToSavedVC(url:String) {
        AppDelegate.router.gotoSavedVC(url: url)
    }
    
    func showScreen() {
        let resultVC = ResultViewController.instantiateFromStoryboardId(.main)
        resultVC.presenter = self
        navigationController?.pushViewController(resultVC, animated: true)
    }
}
