//
//  Service.swift
//  PinSoftApp
//
//  Created by Piksel on 17.12.2021.
//

import Foundation
import Alamofire

// Escaping closure - completion

class Service{
    
    func SearchRequest(endPoint: String,
                       completion: @escaping (SearchResponse?) -> ()){
        let request = AF.request(endPoint)
        request.responseDecodable(of: SearchResponse.self) { (response) in
            completion(response.value)
            print(response.value?.search.count, endPoint)
        }
    }
    
    func DetailRequest(detailId: String, completion: @escaping (DetailResponse?) ->()){
                       let request = AF.request(detailId)
        request.responseDecodable(of: DetailResponse.self){ (response) in
            completion(response.value)
            print(response.value?.imdbID)
        }
    
        
    }
}
