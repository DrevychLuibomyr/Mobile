//
//  DetailsVCPresenter.swift
//  Task-two
//
//  Created by Любчик on 11/24/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation
import UIKit

protocol DetailsVCPresenterProtocol {
    func addToFavourite(model: Model)
}

class DetailsVCPresenter: DetailsVCPresenterProtocol, Presenter {

    let manager: Manager
    private let data: PhotoModel
    var navigationController: UINavigationController?
    
    init(manager: Manager,data: PhotoModel) {
        self.manager = manager
        self.data = data
    }
    
    func addToFavourite(model: Model) {
        manager.submitDataWith(model: model)
    }
    
    func showScreen() {
        let detailsVC = DetailsViewController.instantiateFromStoryboardId(.details)
        detailsVC.presenter = self
        detailsVC.model = data
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
