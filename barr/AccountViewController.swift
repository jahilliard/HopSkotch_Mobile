//
//  AccountViewController.swift
//  barr
//
//  Created by Justin Hilliard on 2/13/16.
//  Copyright © 2016 barrapp. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit

class AccountViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Load Page")

        if (FBSDKAccessToken.currentAccessToken() == nil){
            print("Not Logged in...")
        } else {
            print("Logged in...")
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("Login Complete")
        if (error == nil){
            print("Login Complete...")
            //let mainStory = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
//            self.performSegueWithIdentifier("AccountSeg", sender: self)
//            dispatch_async(dispatch_get_main_queue()) {
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let secondView =  storyboard.instantiateViewControllerWithIdentifier("AccountVC") as UIViewController
//                self.presentViewController(secondView, animated: true, completion: nil)
//                self.performSegueWithIdentifier("AccountSeg", sender: self)
//            }
        } else {
            print(error.localizedDescription)
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out...")
    }
}