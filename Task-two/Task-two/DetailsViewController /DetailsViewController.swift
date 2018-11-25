//
//  DetailsViewController.swift
//  Task-two
//
//  Created by Любчик on 11/1/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit
import SDWebImage

final class DetailsViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var views: UILabel!
    @IBOutlet private weak var photoTitle: UILabel!
    @IBOutlet private weak var owner_Name: UILabel!
    @IBOutlet private weak var likeCount: UILabel!
    @IBOutlet weak var likeButton: UIButton!

    
    var model: PhotoModel!
    var liked = false
    var presenter: DetailsVCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    @IBAction func addToFavourite(_ sender: UIButton) {
        guard let like = Int(model.server ?? "") else { return }
        if !liked {
            likeCount.text = "\(like + 1)" + " likes"
            likeButton.setImage(UIImage(named: "Liked"), for: .normal)
            let model = Model(farm: likeCount.text!, server: self.model.server!, secret: self.model.secret!, id: self.model.id!)
            presenter.addToFavourite(model: model)
            liked = true
        } else {
            likeCount.text = "\(like)" + " likes"
            likeButton.setImage(UIImage(named: "Unliked"), for: .normal)
            liked = false
        }
    }
    
    private func setUpViewController() {
        guard let url = model.url else { return }
        imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"))
        photoTitle.text = model.title
        views.text = "Views: \(model.views ?? ":(")"
        owner_Name.text = model.ownername
        likeCount.text = model.server
    }
    
}


