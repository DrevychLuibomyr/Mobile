//
//  PhotoVCPresenter.swift
//  Task-two
//
//  Created by Любчик on 11/24/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation
import UIKit

protocol PhotoViewControllerProtocol {
    func showDetailsViewController(model: PhotoModel)
    func getData(page: String, onSuccess: @escaping ([PhotoModel]) -> Void, onError: @escaping (String) -> Void)
}

class PhotoVCPresenter: PhotoViewControllerProtocol, Presenter {
    let manager: PhotoManager
    weak var navigationController: UINavigationController?
    private weak var photoVC: PhotosViewController?
    
    init(photoManager: PhotoManager) {
        self.manager = photoManager
    }
    
    func showDetailsViewController(model: PhotoModel) {
        AppDelegate.router.goToDetails(data: model)
    }
    
    func showResults() {
        AppDelegate.router.goToResultScreen()
    }
    
    func showScreen() {
        let photoVC = PhotosViewController.instantiateFromStoryboardId(.main)
        photoVC.presenter = self
        self.photoVC = photoVC
        navigationController?.pushViewController(photoVC, animated: true)
    }
    
    func getData(page: String, onSuccess: @escaping ([PhotoModel]) -> Void, onError: @escaping (String) -> Void) {
        manager.getPhotos(page: page, onSuccess: onSuccess, onError: onError)
    }
    
}
