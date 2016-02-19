//
//  Auth.swift
//  barr
//
//  Created by Justin Hilliard on 2/19/16.
//  Copyright © 2016 barrapp. All rights reserved.
//

import FBSDKCoreKit
import SwiftyJSON

struct Auth {
    static func sendAuthRequest(fbAuthtoken: String){
        let params = ["access_token": fbAuthtoken]
        AlamoHelper.GET("login/facebook", parameters: params, completion: {
            userAuth -> AnyObject in
            print("\(userAuth["isCreated"].rawValue as! Bool)")
            let isCreated = userAuth["isCreated"].rawValue as! Bool
            if (isCreated == true) {
                populateNewUser(fbAuthtoken)
            } else if isCreated == false {
            }
                return true
        })
    }
    
    static func populateNewUser(fbAuthtoken: String){
        print("Graph Call")
        let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,first_name,last_name"], tokenString: fbAuthtoken, version: nil, HTTPMethod: "GET")
        req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
            if(error == nil)
            {
                print("result \(result)")
                let resultJSON = JSON(result)
                updateUserInfo( resultJSON["first_name"].rawString()!, lastName: resultJSON["last_name"].rawString()!, email: resultJSON["email"].rawString()!)
            }
            else
            {
                print("error \(error)")
            }
        })
    }
    
    static func updateUserInfo(firstName: String, lastName: String, email: String){
        print("\(firstName) and \(lastName) and \(email)")
    }
}
