//
//  AppDelegate.swift
//  PushTest
//
//  Created by ivan gonzalez on 2/24/15.
//  Copyright (c) 2015 evolve. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let types:UIUserNotificationType = ([.Alert, .Sound, .Badge])
        let settings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: nil)
        application.registerUserNotificationSettings(settings)
        //application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: (.Badge | .Sound | .Alert), categories: nil));
        application.registerForRemoteNotifications()
   
        if let a = launchOptions {
            let json: NSDictionary = launchOptions! as NSDictionary
            addMessageFromRemoteNotification(json)
        }
        
        
        
        return true
    }
    
    func addMessageFromRemoteNotification(json: NSDictionary){
        let rootVC = window?.rootViewController as! ViewController
        
        
        let uialornk = json["UIApplicationLaunchOptionsRemoteNotificationKey"] as! NSDictionary
        let aps: NSDictionary = uialornk["aps"] as! NSDictionary
        let alert: NSString = aps["alert"] as! NSString
        
        rootVC.theLabel = "\(alert)"
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        print("My Token is: \(deviceToken)")
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        
        print("Failed to get token, error: \(error)")
    }
    
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        
        //println("didReceiveRemoteNotification userInfo: \(userInfo)")
        // aps: { alert = "My first push notification !!!!"; sound = default; }
        
        let json: NSDictionary = userInfo["aps"] as! NSDictionary
        let alert: NSString = json["alert"] as! NSString
        //println(alert)
        
        let rootVC = window?.rootViewController as! ViewController
        rootVC.refresh(alert)
        
    }

    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

