//
//  Reward.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

struct Reward: Codable {
    let trophy: Trophies
    let points: Int
}

enum Trophies: String, Codable {
    case bronzeMedal
    case silverMedal
    case goldMedal
    case zombiesHand
}
