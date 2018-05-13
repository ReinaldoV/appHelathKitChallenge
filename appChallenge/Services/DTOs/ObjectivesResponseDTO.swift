//
//  ObjectivesResponseDTO.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

struct ObjectivesResponseDTO: Codable {
    let items: [ObjectiveDTO]
    let nextPageToken: String
}
