//
//  AppDelegate.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK:- Private Variables

    internal var window: UIWindow?

    //MARK:- UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupMainWindow()
        
        return true
    }
    
    //MARK:- Private methods
    
    /// Sets up the main window for the app
    private func setupMainWindow() {
        window = UIWindow()
        let profileViewController = OTProfileViewController()
        window?.rootViewController = profileViewController
        window?.makeKeyAndVisible()
    }
}

