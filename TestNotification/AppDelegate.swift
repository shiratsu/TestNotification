//
//  AppDelegate.swift
//  TestNotification
//
//  Created by HIRATSUKA SHUNSUKE on 2015/03/06.
//  Copyright (c) 2015年 HIRATSUKA SHUNSUKE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,ZeroPushDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
//        let osVersion = UIDevice.currentDevice().systemVersion
//        if osVersion < "8.0" {
//            application.registerForRemoteNotificationTypes(
//                UIRemoteNotificationType.Badge |
//                    UIRemoteNotificationType.Sound |
//                    UIRemoteNotificationType.Alert )
//            
//            
//        }else{
//            
//            var types: UIUserNotificationType = UIUserNotificationType.Badge |
//                UIUserNotificationType.Alert |
//                UIUserNotificationType.Sound
//            
//            var settings: UIUserNotificationSettings = UIUserNotificationSettings( forTypes: types, categories: nil )
//            
//            application.registerUserNotificationSettings( settings )
//            application.registerForRemoteNotifications()
//        }
        
        
        return true
    }
    
    func application( application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData ) {
        
        //正規表現で文字列置き換え
        // <>と" "(空白)を取る
//        var characterSet: NSCharacterSet = NSCharacterSet( charactersInString: "<>" )
//        
//        var deviceTokenString: String = ( deviceToken.description as NSString )
//            .stringByTrimmingCharactersInSet( characterSet )
//            .stringByReplacingOccurrencesOfString( " ", withString: "" ) as String
//        
//        println( deviceTokenString )
        ZeroPush.shared().registerDeviceToken(deviceToken)
        let tokenString:String! = ZeroPush.deviceTokenFromData(deviceToken)
        println(tokenString)
        
        
    }
    
    func application(application: UIApplication!, didFailToRegisterForRemoteNotificationsWithError error: NSError!) {
        // プッシュ通知が利用不可であればerrorが返ってくる
        NSLog("error: " + "\(error)")
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
        
        
        ZeroPush.engageWithAPIKey("iosdev_wfXyc6rELDKW1Vwe5N1q", delegate: self)
        
        let osVersion = UIDevice.currentDevice().systemVersion
        if osVersion < "8.0" {
            ZeroPush.shared().registerForRemoteNotificationTypes(UIRemoteNotificationType.Badge |
                UIRemoteNotificationType.Sound |
                UIRemoteNotificationType.Alert)
        }else{
            ZeroPush.shared().registerForRemoteNotifications()
        }
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

