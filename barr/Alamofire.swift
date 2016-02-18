//
//  Alamofire.swift
//  barr
//
//  Created by Justin Hilliard on 2/18/16.
//  Copyright © 2016 barrapp. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct AlamoHelper {
    let headers = [
        "content-type": "application/json"
    ]
    
    let domain = "http://10.0.0.2:3000/"

    func get(subdomain: String, parameters: [String: AnyObject], completion: (response: JSON) -> Void){
        Alamofire.request(.GET, domain + subdomain, headers: headers, parameters: parameters)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        completion(response: json);
                    }
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    func post(subdomain: String, parameters: [String: AnyObject], completion: (response: JSON) -> Void){
        Alamofire.request(.POST, domain + subdomain, headers: headers, parameters: parameters)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        completion(response: json);
                    }
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    func delete(subdomain: String, parameters: [String: AnyObject], completion: (response: JSON) -> Void){
        Alamofire.request(.DELETE, domain + subdomain, headers: headers, parameters: parameters)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        completion(response: json);
                    }
                case .Failure(let error):
                    print(error)
                }
        }
    }
}
