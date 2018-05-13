//
//  ObjectiveListViewController.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import UIKit

class ObjectiveListViewController: UIViewController {
    
    let kObjectiveListCellIdentifier = "ObjectiveCell"
    
    @IBOutlet weak var table: UITableView!
    
    var presenter: ObjectiveListPresenterProtocol!
    var objectivesList: [ObjectiveListViewItemModel] = []
    
    static func instantiate(presenter: ObjectiveListPresenterProtocol) -> ObjectiveListViewController {
        let vc = UIStoryboard(name: "ObjectiveListViewStoryboard", bundle: nil).instantiateViewController(
            withIdentifier: "ObjectiveListViewController") as! ObjectiveListViewController
        presenter.view = vc
        vc.presenter = presenter
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        self.title = "Objectives list"
        let objectiveListCellNib = UINib(nibName: "ObjectiveListCell", bundle: nil)
        self.table.register(objectiveListCellNib, forCellReuseIdentifier: kObjectiveListCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getObjectives()
    }
}

extension ObjectiveListViewController: ObjectiveListViewProtocol {
    func showObjectiveList(objectivesList: [ObjectiveListViewItemModel]) {
        self.objectivesList = objectivesList
        table.reloadData()
    }
}

extension ObjectiveListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectivesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: kObjectiveListCellIdentifier) as? ObjectiveListCell {
            let objective = objectivesList[indexPath.row]
            cell.titleLabel.text = objective.title
            cell.descriptionLabel.text = objective.description
            cell.medalImageView.image = objective.medalImage
            if !objective.isCompleted {
                cell.medalImageView.isHidden = true
                cell.checkImageView.isHidden = true
            }
            return cell
        }
        return UITableViewCell()
    }
}
