//
//  LoginViewController.swift
//  barr
//
//  Created by Justin Hilliard on 2/13/16.
//  Copyright © 2016 barrapp. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Alamofire

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Load Page")
        
        if (FBSDKAccessToken.currentAccessToken() == nil){
            print("Not Logged in...")
            notLoggedIn()
        } else {
            print("Logged in...")
            notLoggedIn()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func notLoggedIn(){
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let loginButton = FBSDKLoginButton()
        let signUpEmail = UITextField(frame: CGRect(x: (screenWidth * 0.125), y: (screenHeight * 0.5), width: screenWidth * 0.75, height: screenHeight * 0.1))
        signUpEmail.backgroundColor = UIColor.greenColor()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        
        let X_Position:CGFloat = (screenWidth * 0.5) //use your X position here
        let Y_Position:CGFloat = (screenHeight * 0.75) //use your Y position here
        
        loginButton.frame = CGRectMake((X_Position-loginButton.frame.width/2), Y_Position, loginButton.frame.width, loginButton.frame.height)
        
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
        self.view.addSubview(signUpEmail)
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if (error == nil){
            Auth.sendAuthRequest(result.token.tokenString)
//            print(User.createUser(result.token.tokenString))
            print("Login Complete...")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewController = storyboard.instantiateViewControllerWithIdentifier("mapView")
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
        } else {
            print(error.localizedDescription)
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out...")
    }
}