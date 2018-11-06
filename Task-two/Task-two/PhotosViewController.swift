//
//  PhotosViewController.swift
//  Task-two
//
//  Created by Любчик on 10/31/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: -  Variables
    private let photoManager = PhotoManager()
    private var dataSource = [PhotoModel?]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(page: "18")
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.collectionCellIdentifier)
    }
    
    //MARK: Private
    private func fetchData(completion: (() -> Void)? = nil, page: String) {
        photoManager.getPhotos(page: page, onSuccess: { [weak self] photos in
            self?.dataSource = photos
            completion?()
        }) { [weak self] errorString in
            guard let `self` = self else { return }
            AlertHelper.showAlert(on: self, message: errorString, buttonTitle: "Ok", buttonAction: {}, showCancelButton: false)
            completion?()
        }
    }
    
    private func presentDetailsVC(model: PhotoModel) {
        let detailtStoryboard = UIStoryboard(name: "DetailsViewController", bundle: nil)
        guard let vc = detailtStoryboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        vc.model = model
        self.present(vc, animated: true, completion:  nil)
    }
    
    @IBAction func reloadCollection(_ sender: Any) {
        collectionView.reloadData()
    }
    
}

//MARK: - UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionCellIdentifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        let data = dataSource[indexPath.row]
        cell.setUpCell(model: data!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let data = dataSource[indexPath.row] else { return }
        presentDetailsVC(model: data)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == dataSource.count - 1 {
            Async.mainQueue { [weak self] in
                self?.fetchData(page: "20")
                self?.collectionView.reloadData()
            }
        }
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width / Constants.numbersOfColumns - Constants.spaceBetweenCell
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
}
