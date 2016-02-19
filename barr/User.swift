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
import FBSDKCoreKit

class User {

    var email: String?
    var fbId: String?
    var fbAuthtoken: String
    var userId: String?
    var accessToken: String?
    var phoneNumber: Int?
    var firstName: String?
    var lastName: String?
    var petName: String?
    var age: Int?
    var blockList: [String]?
    
    static let prefs = NSUserDefaults.standardUserDefaults()
    
    
    init(fbAuthtoken: String, fbId: String, accessToken: String, userId: String, email: String, firstName: String, lastName: String) {
        
        User.prefs.setValue(fbAuthtoken, forKey: "fbAuthtoken")
        User.prefs.setValue(fbId, forKey: "fbId")
        User.prefs.setValue(accessToken, forKey: "barrAuthToken")
        User.prefs.setValue(userId, forKey: "barrId")
    }
    
    init(fbAuthtoken: String, fbId: String, access_token: String, userId: String){
        self.fbAuthtoken = fbAuthtoken
        self.fbId = fbId
        self.accessToken = access_token
        self.userId = userId
        //WILL NEED TO MOD
//        self.firstName = name
//        self.email = email
//        self.prefs.setValue(fbAuthtoken, forKey: "fbAuthtoken")
//        self.prefs.setValue(fbId, forKey: "fbId")
//        self.prefs.setValue(accessToken, forKey: "barrAuthToken")
//        self.prefs.setValue(userId, forKey: "barrId")
//        self.prefs.setValue(name, forKey: "name")
//        self.prefs.setValue(email, forKey: "email")
    }
    
    static func getNameEmail(fbAuthtoken: String, completion: (name: String, email:String) -> User){
        let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: fbAuthtoken, version: nil, HTTPMethod: "GET")
        req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
            if(error == nil)
            {
                print("result \(result)")
                completion(name: result["name"] as! String, email: result["email"] as! String)
            }
            else
            {
                print("error \(error)")
            }
        })
    }
    
//    static func createUser(fbAuthtoken: String) -> User {
//        let params = ["access_token": fbAuthtoken]
//        AlamoHelper.GET("login/facebook", parameters: params, completion: {
//            responseAuth -> User in
//            User.getNameEmail(fbAuthtoken, completion: {
//                (name, email) -> User in
//                    print(name);
//                    print(responseAuth);
//                    let fbId = responseAuth["fbId"].rawString()
//                    let accessToken = responseAuth["authToken"].rawString()
//                    let userId = responseAuth["id"].rawString()
//                    return User(fbAuthtoken: fbAuthtoken, fbId: fbId!, access_token: accessToken!, userId: userId!, name: name, email: email)
//                
//            })
//        })
//    }
    
//    func renewAuthToken(){
//        if let auth_token = prefs.stringForKey("barrAuthToken"){
//            let params = ["access_token": auth_token, "email": self.email!]
//            AlamoHelper.GET("login", parameters: params, completion: {
//                response -> Void in
//                print(response);
//                self.fbId = response["fbId"].rawString()
//                self.accessToken = response["authToken"].rawString()
//                self.userId = response["id"].rawString()
//                self.prefs.setValue(self.fbAuthtoken, forKey: "fbAuthtoken")
//                self.prefs.setValue(self.fbId, forKey: "fbId")
//                self.prefs.setValue(self.accessToken, forKey: "barrAuthToken")
//                self.prefs.setValue(self.userId, forKey: "barrId")
//            });
//            
//        }
//    }
    
    func makeFbGraphCall(parameters: [String: String], completion: (response: JSON) -> Void){
        let req = FBSDKGraphRequest(graphPath: "me", parameters: parameters, tokenString: self.fbAuthtoken, version: nil, HTTPMethod: "GET")
        req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
            if(error == nil)
            {
                print("result \(result)")
                completion(response: JSON(result))
            }
            else
            {
                print("error \(error)")
            }
        })
    }
    
}
