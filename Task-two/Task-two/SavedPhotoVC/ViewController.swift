//
//  ViewController.swift
//  Task-two
//
//  Created by Любчик on 12/3/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"))
    }

}
