//
//  Objective.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

struct Objective: Codable {
    let title: String
    let description: String
    let type: ObjectiveType
    let goal: Double
    let progress: Double
    let reward: Reward
}

extension Objective: Equatable {
    static func == (lhs: Objective, rhs: Objective) -> Bool {
        return lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.type == rhs.type &&
            lhs.goal == rhs.goal &&
            lhs.progress == rhs.progress &&
            lhs.reward == rhs.reward
    }
}

enum ObjectiveType: String, Codable {
    case step
    case walkingDistance
    case runningDistance
}
