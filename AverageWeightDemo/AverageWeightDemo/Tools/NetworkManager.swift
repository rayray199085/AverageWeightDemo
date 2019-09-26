//
//  NetworkManager.swift
//  AverageWeightDemo
//
//  Created by Stephen Cao on 26/9/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager{
    static let shared = NetworkManager()
    
    func request(urlString:String, method:HTTPMethod, params:[String:Any]?, completion :@escaping (_ data: Data?, _ response: Any?,_ isSuccess: Bool,_ error: Error?)->() ){
        Alamofire.request(urlString, method: method, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
            completion(
                dataResponse.data,
                dataResponse.result.value,
                dataResponse.result.isSuccess,
                dataResponse.result.error)
            
        }
    }
}
extension NetworkManager{
    func fetchProductsInfoWith(urlString: String?, completion:@escaping (_ data: Data?, _ isSuccess: Bool)->()){
        guard let urlString = urlString else{
            completion(nil, false)
            return
        }
       request(urlString: urlString, method: .get, params: nil) { (data, res, isSuccess, _) in
            completion(data, isSuccess)
        }
    }
}
