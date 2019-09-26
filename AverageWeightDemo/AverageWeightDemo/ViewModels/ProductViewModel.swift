//
//  ProductViewModel.swift
//  AverageWeightDemo
//
//  Created by Stephen Cao on 26/9/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

struct ProductViewModel {
    var weight: Double = 0
    var isAirConditioner: Bool = false
    
    init(product: Product) {
        if product.category != Constants.targeCategory{
            return
        }
        if let height = product.size?.height,
           let length = product.size?.length,
           let width = product.size?.width,
           let factor = product.weight{
            isAirConditioner = true
            weight = (height / 100) * (length / 100) * (width / 100) * factor
        }
    }
}
