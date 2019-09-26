//
//  ListViewModel.swift
//  AverageWeightDemo
//
//  Created by Stephen Cao on 26/9/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

class ListViewModel{
    private var airConditionerTotalWeight: Double = 0
    private var airConditionerCount = 0
    
    func getAirConditionerAverageWeight(completion:@escaping (_ weight: Double)->()){
        let urlString = Constants.baseUrl + Constants.initialUrl
        NetworkManager.shared.fetchProductsInfoWith(urlString: urlString) { (data, isSuccess) in
            self.handleProductInfoData(data: data) { (averageWeight) in
               completion(averageWeight)
            }
        }
    }
    
    func handleProductInfoData(data: Data?, completion:@escaping (_ weight: Double)->()){
        guard let data = data,
              let productInfo = try? JSONDecoder().decode(ProductsInfo.self, from: data) else{
                completion(airConditionerTotalWeight / Double(airConditionerCount))
            return
        }
        for product in productInfo.objects ?? []{
            let viewModel = ProductViewModel(product: product)
            if viewModel.isAirConditioner{
                airConditionerCount += 1
                airConditionerTotalWeight += viewModel.weight
                
            }
        }
        if let nextPageUrl = productInfo.next,
            nextPageUrl.count > 0{
            NetworkManager.shared.fetchProductsInfoWith(urlString: Constants.baseUrl + nextPageUrl) { (data, isSuccess) in
                self.handleProductInfoData(data: data, completion: completion)
            }
        }else{
            completion(airConditionerTotalWeight / Double(airConditionerCount))
        }
    }
}
