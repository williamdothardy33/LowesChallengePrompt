//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = .systemBlue
        barAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        let appearance = UINavigationBar.appearance()
        appearance.scrollEdgeAppearance = barAppearance
        appearance.compactAppearance = barAppearance
        appearance.standardAppearance = barAppearance
        if #available(iOS 15.0, *) {
            appearance.compactScrollEdgeAppearance = barAppearance
        }
        UINavigationBar.appearance().tintColor = .white
        
        return true
    }
}
