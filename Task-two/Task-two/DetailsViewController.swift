//
//  DetailsViewController.swift
//  Task-two
//
//  Created by Любчик on 11/1/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var views: UILabel!
    @IBOutlet weak var photoTitle: UILabel!
    
    var model: PhotoModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    private func setUpViewController() {
        guard let url = model.url else { return }
        imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"))
        views.text = model.views
        photoTitle.text = model.title
    }
    
}


