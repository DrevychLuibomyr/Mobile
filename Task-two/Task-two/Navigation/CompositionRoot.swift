//
//  CompositionRoot.swift
//  Task-two
//
//  Created by Любчик on 11/24/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation
import UIKit


protocol Presenter {
    var navigationController: UINavigationController? { get set }
    func showScreen()
}


class CompositionRoot {
    private var currentPresenter: Presenter?
    private (set) var navigationController = UINavigationController()
    
    func gotToPhotos() {
        let manager = PhotoManager()
        let presenter = PhotoVCPresenter(photoManager: manager)
        currentPresenter = presenter
        showCurrentScreen()
    }
    
    func gotoSavedVC(url: String) {
        showCurrentScreen()
    }
    
    func goToResultScreen() {
        let manager = Manager()
        let presenter = ResultVCPresenter(manager: manager)
        currentPresenter = presenter
        showCurrentScreen()
    }
    
    func goToDetails(data: PhotoModel) {
        let manager = Manager()
        let presenter = DetailsVCPresenter(manager: manager, data: data)
        currentPresenter = presenter
        showCurrentScreen()
    }
    
    private func showCurrentScreen() {
        currentPresenter?.navigationController = navigationController
        currentPresenter?.showScreen()
    }
    
}
