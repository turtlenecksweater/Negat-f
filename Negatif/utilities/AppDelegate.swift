//
//  AppDelegate.swift
//  Negatif
//
//  Created by Spencer  Pearlman on 5/17/18.
//  Copyright © 2018 Spencer.io. All rights reserved.
//

import UIKit
import Photos
import Firebase
import FBSDKCoreKit
//import PhotoEditorSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func setRootController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if Auth.auth().currentUser != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "developPhotos")
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
            print(Auth.auth().currentUser?.displayName ?? "No user found")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "login")
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
            print("Name: \(Auth.auth().currentUser?.displayName ?? "No user found")")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        setRootController()
        
//        if let licenseURL = Bundle.main.url(forResource: "ios_license", withExtension: "dms"){
//            PESDK.unlockWithLicense(at: licenseURL)
//        }
    
        UIApplication.shared.statusBarStyle = .lightContent

        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        
        return handled
    }
    
    func goToViewController(){
//        DispatchQueue.main.async(execute: {() -> Void in
//            self.window = UIWindow(frame: UIScreen.main.bounds)
//            if let window = self.window{
//                window.backgroundColor = UIColor.white
//                //let nav = UINavigationController()
//                let mainView = PhotoLibraryViewController()
//                //nav.viewControllers = [mainView]
////                window.rootViewController = nav
////                window.makeKeyAndVisible()
//            }
//        })
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

