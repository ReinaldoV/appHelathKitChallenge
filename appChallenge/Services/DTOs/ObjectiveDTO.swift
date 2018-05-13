//
//  ObjectiveDTO.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

struct ObjectiveDTO: Codable {
    let id: String
    let title: String
    let description: String
    let type: String
    let goal: Double
    let reward: RewardDTO
}
