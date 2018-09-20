//
//  ResultViewController.swift
//  Task-two
//
//  Created by Любчик on 9/20/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
}

extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cells") as? TableViewCell else { return UITableViewCell() }
        cell.userName.text = Manager.getFirstName()
        cell.userNickName.text = Manager.getNickName()
        cell.userPhone.text = Manager.getPhone()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
