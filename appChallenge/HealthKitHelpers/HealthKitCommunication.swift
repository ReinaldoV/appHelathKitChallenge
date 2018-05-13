//
//  HealthKitCommunication.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import HealthKit

class HealthKitCommunication {

    let healthAuth = HKHealthStore()

    private func getPermission(completion: @escaping (Bool) -> ()) {
        guard let distanceType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning) else {
            print("Something went wrong asking for distanceWalkingRunning")
            return
        }
        guard let stepsType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) else {
            print("Something went wrong asking for steps")
            return
        }

        let read: Set<HKObjectType> = [distanceType, stepsType]
        healthAuth.requestAuthorization(toShare: nil, read: read) { (isAccessGiven, error) in
            completion(isAccessGiven)
        }
    }

    func getTodaySteps(completion: @escaping (Double) -> ()) {
        getPermission { (isAccessGiven) in
            if isAccessGiven {
                guard let type = HKSampleType.quantityType(forIdentifier: .stepCount) else {
                    fatalError("Something went wrong retriebing quantity type stepCount")
                }
                let date = Date()
                let cal = Calendar(identifier: Calendar.Identifier.gregorian)
                let newDate = cal.startOfDay(for: date)

                let predicate = HKQuery.predicateForSamples(withStart: newDate, end: Date(), options: .strictStartDate)

                let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: [.cumulativeSum]) { (query, statistics, error) in
                    var value: Double = 0

                    if error != nil {
                        print("something went wrong")
                    } else if let quantity = statistics?.sumQuantity() {
                        value = quantity.doubleValue(for: HKUnit.count())
                    }
                    completion(value)
                }
                self.healthAuth.execute(query)
            } else {
                print("Not Access given")
                completion(0)
            }
        }
    }

    func getTodayDistanceWalkedAndRunned(completion: @escaping (Double) -> ()) {
        getPermission { (isAccessGiven) in
            if isAccessGiven {
                guard let type = HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning) else {
                    fatalError("Something went wrong retriebing quantity type distanceWalkingRunning")
                }
                let date = Date()
                let cal = Calendar(identifier: Calendar.Identifier.gregorian)
                let newDate = cal.startOfDay(for: date)

                let predicate = HKQuery.predicateForSamples(withStart: newDate, end: Date(), options: .strictStartDate)

                let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: [.cumulativeSum]) { (query, statistics, error) in
                    var value: Double = 0

                    if error != nil {
                        print("something went wrong")
                    } else if let quantity = statistics?.sumQuantity() {
                        value = quantity.doubleValue(for: HKUnit.meter())//quantity.doubleValue(for: HKUnit.meterUnit(with: .kilo))
                    }
                    completion(value)
                }
                self.healthAuth.execute(query)
            } else {
                print("Not Access given")
                completion(0)
            }
        }
    }
}
