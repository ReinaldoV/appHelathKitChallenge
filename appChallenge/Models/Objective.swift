//
//  Objective.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

struct Objective {
    let title: String
    let description: String
    let type: ObjectiveType
    let goal: Float
    let progress: Float
    let reward: Reward
}

enum ObjectiveType {
    case step
    case walkingDistance
    case runningDistance
}
