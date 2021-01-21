//
//  AppDelegate.swift
//  myApp
//
//  Created by zzw on 2020/9/1.
//  Copyright © 2020 weichuang. All rights reserved.
//

import UIKit
import flutter_boost
import Flutter
import FlutterPluginRegistrant
@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {


        GeneratedPluginRegistrant.register(with: self)

        let router = PlatformRouterImp.init();
        FlutterBoostPlugin.sharedInstance().startFlutter(with: router, onStart: { (engine) in
            
        });
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let viewController = ViewController.init()
        let navi = UINavigationController.init(rootViewController: viewController)
        self.window.rootViewController = navi
        self.window.makeKeyAndVisible()
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    
    
}

