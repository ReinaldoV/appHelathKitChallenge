//
//  ObjectiveListViewController.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import UIKit

class ObjectiveListViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
}

extension ObjectiveListViewController: ObjectiveListViewProtocol {
    func showObjectiveList(objectivesList: [ObjectiveListViewItemModel]) {
        
    }
}

extension ObjectiveListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
