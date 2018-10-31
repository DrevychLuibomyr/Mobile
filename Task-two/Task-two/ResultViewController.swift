//
//  ResultViewController.swift
//  Task-two
//
//  Created by Любчик on 10/11/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
   
    @IBOutlet weak var tableVIew: UITableView!
    
    var model = [Model]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDataSource()
    }
    
    func getDataSource() {
       model = Manager.getUserDefaults()
    }
    
}

//MARK: UITableViewDataSource
extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? TableViewCell else { return UITableViewCell()}
        let dataSource = model[indexPath.row]
        cell.email.text = dataSource.email
        cell.lastName.text = dataSource.secondName
        cell.userName.text = dataSource.firstName
        return cell
    }
    
}
