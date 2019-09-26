//
//  ViewController.swift
//  AverageWeightDemo
//
//  Created by Stephen Cao on 26/9/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let listViewModel = ListViewModel()
    @IBOutlet weak var averageWeightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listViewModel.getAirConditionerAverageWeight { [weak self](averageWeight) in
            self?.averageWeightLabel.text = String(format: "Average weight: %.2f kg", averageWeight)
        }
    }
}

