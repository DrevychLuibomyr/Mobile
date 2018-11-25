//
//  CollectionViewCell.swift
//  Task-two
//
//  Created by Любчик on 10/31/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    func setUpCell(model: PhotoModel) {
        guard let url = model.url else { return }
        imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: Constants.placeholder))
    }

}
