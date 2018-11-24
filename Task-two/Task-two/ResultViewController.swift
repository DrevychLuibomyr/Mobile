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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.rowHeight = UITableViewAutomaticDimension
        tableVIew.estimatedRowHeight = tableVIew.rowHeight
        navigationItem.rightBarButtonItem = editButtonItem
        getDataSource()
    }
    
    private func getDataSource() {
       model = Manager.getPersons()
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
        cell.likes.text = dataSource.likesCount
        cell.id.text = dataSource.id
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let data = model[indexPath.section]
            model.remove(at: indexPath.row)
            Manager.removeFromUserDefaults()
            tableVIew.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
}
