//
//  Alamofire.swift
//  barr
//
//  Created by Justin Hilliard on 2/18/16.
//  Copyright © 2016 barrapp. All rights reserved.
//

import Alamofire
import SwiftyJSON

let headers = [
    "content-type": "application/json"
]


struct AlamoHelper {

    static let domain = "http://150.212.62.71:3000/"
//    static let domain = "http://10.0.0.2:3000/"
//    static let domain = "http://128.237.181.151:3000/"

    static func GET(subdomain: String, parameters: [String: AnyObject], completion: (response: JSON) -> AnyObject){
        Alamofire.request(.GET, self.domain + subdomain, headers: headers, parameters: parameters)
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
    
    static func POST(subdomain: String, parameters: [String: AnyObject], completion: (response: JSON) -> AnyObject){
        Alamofire.request(.POST, self.domain + subdomain, headers: headers, parameters: parameters)
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
    
    static func DELETE(subdomain: String, parameters:[String: AnyObject], completion: (response: JSON) -> AnyObject){
        Alamofire.request(.DELETE, self.domain + subdomain, headers: headers, parameters: parameters)
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
