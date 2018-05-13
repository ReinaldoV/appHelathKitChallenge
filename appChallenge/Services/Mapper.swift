//
//  Mapper.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

class Mapper {
    static func objectivesFromObjectivesResponseDTO(response: ObjectivesResponseDTO) -> [Objective] {
        var objectivesList: [Objective] = []

        for objectiveDTO in response.items {
            let title = objectiveDTO.title
            let description = objectiveDTO.description
            let type = getTypeOfObjective(objective: objectiveDTO.type)
            let goal = objectiveDTO.goal
            let reward = Reward(trophy: getMedalFromString(medal: objectiveDTO.reward.trophy),
                                points: objectiveDTO.reward.points)

            let objective = Objective(title: title,
                                      description: description,
                                      type: type,
                                      goal: goal,
                                      progress: 0,
                                      reward: reward)

            objectivesList.append(objective)
        }
        return objectivesList
    }
}

extension Mapper {
    private static func getTypeOfObjective(objective: String) -> ObjectiveType {
        switch objective {
        case "step":
            return ObjectiveType.step
        case "walking_distance":
            return ObjectiveType.walkingDistance
        case "running_distance":
            return ObjectiveType.runningDistance
        default:
            return ObjectiveType.step
        }
    }

    private static func getMedalFromString(medal: String) -> Trophies {
        switch medal {
        case "bronze_medal":
            return Trophies.bronzeMedal
        case "silver_medal":
            return Trophies.silverMedal
        case "gold_medal":
            return Trophies.goldMedal
        case "zombie_hand":
            return Trophies.zombiesHand
        default:
            return Trophies.bronzeMedal
        }
    }
}
