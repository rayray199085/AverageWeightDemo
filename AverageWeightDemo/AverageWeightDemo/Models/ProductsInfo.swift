//
//  ProductsInfo.swift
//  AverageWeightDemo
//
//  Created by Stephen Cao on 26/9/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

struct ProductsInfo: Codable{
    let objects: [Product]?
    let next: String?
}

struct Product: Codable{
    let category: String?
    let title: String?
    let weight: Double?
    let size: ProductSize?
}
struct ProductSize: Codable{
    let width: Double?
    let length: Double?
    let height: Double?
}
