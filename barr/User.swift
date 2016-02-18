//
//  User.swift
//  barr
//
//  Created by Justin Hilliard on 2/10/16.
//  Copyright © 2016 barrapp. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class User {

    var email: String?
    var fbId: String?
    var password: String?
    var userId: String?
    var accessToken: String?
    var phoneNumber: Int?
    var firstName: String?
    var lastName: String?
    var petName: String?
    var age: Int?
    var blockList: [String]?
    
    init(fbId: String){
        self.fbId = fbId;
    }
    
    func signUpUser(){
        let subdomain = "user/create"
        
        let reqBody = [
            "email": self.email,
            "password": self.password
        ]
        
        Alamofire.request(.POST, "https://barrapp.com/" + subdomain, headers: headers, parameters: reqBody)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                if response.response?.statusCode == 200 {
//                    if let accessToken = response.data.{
//                        self.accessToken = accessToken
//                    }
                }

        }
        
    }
    
    func validateUser(){
        if let defToken = self.accessToken {
            
        }

        let subdomain = "login"
        
        Alamofire.request(.POST, "https://barrapp.com/" + subdomain, headers: headers)
            .responseJSON { response in
                debugPrint(response)
        }
    }
    
    func modifyPetName(newName: String){
//        Alamofire.request(.POST, "https://barrapp.com/" + subdomain, headers: headers)
//            .responseJSON { response in
//                debugPrint(response)
//        }
    }
    
}
