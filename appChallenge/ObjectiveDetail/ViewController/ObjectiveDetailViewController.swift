//
//  ObjectiveDetailViewController.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import UIKit

class ObjectiveDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var trophyImageView: UIImageView!
}

extension ObjectiveDetailViewController: ObjectiveDetailViewProtocol {
    func refreshObjective(objective: ObjectiveDetailViewModel) {
        self.titleLabel.text = objective.title
        self.descriptionLabel.text = objective.description
        self.percentageLabel.text = objective.percentage + "%"
        progressView.progress = Float(objective.current / objective.goal)
        self.progressLabel.text = String(format:"%.1f / %.1f", objective.current, objective.goal)
        self.trophyImageView.image = objective.throphyImage
        if !objective.isCompleted {
            self.trophyImageView.isHidden = true
            self.checkImageView.isHidden = true
        }
    }
}
