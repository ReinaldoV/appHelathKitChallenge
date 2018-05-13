//
//  ViewController.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 12/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HealthKitCommunication().getTodayDistanceWalkedAndRunned { distance in
            print("Distance: %.1f", distance)
        }
        HealthKitCommunication().getTodaySteps { distance in
            print("Steps: %.1f", distance)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

